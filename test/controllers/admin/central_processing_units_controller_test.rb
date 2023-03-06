require "test_helper"

class Admin::CentralProcessingUnitsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_central_processing_units_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_central_processing_units_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_central_processing_units_update_url
    assert_response :success
  end
end
