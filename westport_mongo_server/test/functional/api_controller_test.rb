require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get createDepartment" do
    get :createDepartment
    assert_response :success
  end

  test "should get createIncident" do
    get :createIncident
    assert_response :success
  end

  test "should get getDepartments" do
    get :getDepartments
    assert_response :success
  end

  test "should get getIncidents" do
    get :getIncidents
    assert_response :success
  end

  test "should get updateIncidents" do
    get :updateIncidents
    assert_response :success
  end

end
