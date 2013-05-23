require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get createIncident" do
    get :createIncident
    assert_response :success
  end

  test "should get updateIncident" do
    get :updateIncident
    assert_response :success
  end

  test "should get showIncident" do
    get :showIncident
    assert_response :success
  end

end
