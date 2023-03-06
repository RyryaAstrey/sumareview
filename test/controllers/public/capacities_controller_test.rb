require "test_helper"

class Public::CapacitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_capacities_show_url
    assert_response :success
  end
end
