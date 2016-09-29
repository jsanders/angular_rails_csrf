require 'test_helper'

class AngularRailsCsrfExceptionTest < ActionController::TestCase
  tests ExclusionsController

  setup do
    @controller.allow_forgery_protection = true
    @correct_token = @controller.send(:form_authenticity_token)
  end

  test "a get does not set the XSRF-TOKEN cookie" do
    get :index
    assert_not_equal @correct_token, cookies['XSRF-TOKEN']
    assert_response :success
  end
end