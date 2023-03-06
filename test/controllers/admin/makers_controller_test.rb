require "test_helper"

class Admin::MakersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_makers_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_makers_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_makers_update_url
    assert_response :success
  end
end
