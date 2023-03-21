require "test_helper"

class Admin::SpecsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_specs_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_specs_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_specs_update_url
    assert_response :success
  end
end
