# frozen_string_literal: true

require 'test_helper'

class AngularRailsCsrfTest < ActionController::TestCase
  tests ApplicationController

  test 'a get sets the XSRF-TOKEN cookie but does not require the X-XSRF-TOKEN header' do
    get :index
    assert_valid_cookie
    assert_response :success
  end

  test 'a post raises an error without the X-XSRF-TOKEN header set' do
    assert_raises ActionController::InvalidAuthenticityToken do
      post :create
    end
  end

  test 'a post raises an error with the X-XSRF-TOKEN header set to the wrong value' do
    header_to 'garbage'
    assert_raises ActionController::InvalidAuthenticityToken do
      post :create
    end
  end

  test 'a post is accepted if X-XSRF-TOKEN is set properly' do
    header_to @controller.send(:form_authenticity_token)
    post :create
    assert_valid_cookie
    assert_response :success
  end

  test 'the domain is used if present' do
    begin
      config = Rails.application.config
      def config.angular_rails_csrf_domain
        :all
      end

      get :index
      assert @response.headers['Set-Cookie'].include?('.test.host')
      assert_valid_cookie
      assert_response :success
    ensure
      config.instance_eval('undef :angular_rails_csrf_domain', __FILE__, __LINE__)
    end
  end

  test 'the secure flag is set if configured' do
    begin
      @request.headers['HTTPS'] = 'on'

      config = Rails.application.config
      config.define_singleton_method(:angular_rails_csrf_secure) { true }

      get :index
      assert @response.headers['Set-Cookie'].include?('secure')
      assert_valid_cookie
      assert_response :success
    ensure
      @request.headers['HTTPS'] = nil
      config.instance_eval('undef :angular_rails_csrf_secure', __FILE__, __LINE__)
    end
  end

  test 'a custom name is used if present' do
    use_custom_cookie_name do
      get :index
      assert @response.headers['Set-Cookie'].include?('CUSTOM-COOKIE-NAME')
      assert_valid_cookie('CUSTOM-COOKIE-NAME')
      assert_response :success
    end
  end

  test 'same_site is set to Lax by default' do
      get :index
      assert @response.headers['Set-Cookie'].include?('SameSite=Lax')
      assert_valid_cookie
      assert_response :success
  end

  test 'same_site can be configured' do
    begin
      config = Rails.application.config
      config.define_singleton_method(:angular_rails_csrf_same_site) { :strict }

      get :index
      assert @response.headers['Set-Cookie'].include?('SameSite=Strict')
      assert_valid_cookie
      assert_response :success
    ensure
      config.instance_eval('undef :angular_rails_csrf_same_site', __FILE__, __LINE__)
    end
  end

  test 'secure is set automatically when same_site is set to none' do
    begin
      @request.headers['HTTPS'] = 'on'

      config = Rails.application.config
      config.define_singleton_method(:angular_rails_csrf_same_site) { :none }

      get :index
      assert @response.headers['Set-Cookie'].include?('SameSite=None')
      assert @response.headers['Set-Cookie'].include?('secure')
      assert_valid_cookie
      assert_response :success
    ensure
      config.instance_eval('undef :angular_rails_csrf_same_site', __FILE__, __LINE__)
    end
  end

  private

  # Helpers

  def header_to(value)
    @request.headers['X-XSRF-TOKEN'] = value
  end

  def assert_valid_cookie(name = 'XSRF-TOKEN')
    if @controller.respond_to?(:valid_authenticity_token?, true)
      assert @controller.send(:valid_authenticity_token?, session, cookies[name])
    else
      assert_equal @controller.send(:form_authenticity_token), cookies['XSRF-TOKEN']
    end
  end

  def use_custom_cookie_name
    config = Rails.application.config
    def config.angular_rails_csrf_cookie_name
      'CUSTOM-COOKIE-NAME'
    end
    yield
  ensure
    eval <<-RUBY, binding, __FILE__, __LINE__ + 1
      config.instance_eval('undef :angular_rails_csrf_cookie_name')
    RUBY
  end
end
