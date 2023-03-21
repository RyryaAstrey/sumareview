require "test_helper"

class Admin::CapacitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_capacities_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_capacities_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_capacities_update_url
    assert_response :success
  end
end
