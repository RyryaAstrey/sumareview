require "test_helper"

class Admin::OperationSystemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_operation_systems_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_operation_systems_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_operation_systems_update_url
    assert_response :success
  end
end
