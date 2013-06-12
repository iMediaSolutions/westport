require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get create_incident" do
    get :create_incident
    assert_response :success
  end

  test "should get update_incident" do
    get :update_incident
    assert_response :success
  end

  test "should get create_staff" do
    get :create_staff
    assert_response :success
  end

  test "should get update_staff" do
    get :update_staff
    assert_response :success
  end

  test "should get get_incidents" do
    get :get_incidents
    assert_response :success
  end

  test "should get get_incident" do
    get :get_incident
    assert_response :success
  end

end
