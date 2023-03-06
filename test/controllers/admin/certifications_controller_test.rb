require "test_helper"

class Admin::CertificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_certifications_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_certifications_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_certifications_update_url
    assert_response :success
  end
end
