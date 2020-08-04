# frozen_string_literal: true

require 'test_helper'

class AngularRailsCsrfSkipTest < ActionController::TestCase
  tests ApiController

  test 'csrf-cookie is not set and no error if protect_against_forgery? is not defined' do
    refute @controller.respond_to?(:protect_against_forgery?)
    get :index
    assert_nil cookies['XSRF-TOKEN']
    assert_response :success
  end

end
