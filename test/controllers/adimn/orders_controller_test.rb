require "test_helper"

class Adimn::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get adimn_orders_show_url
    assert_response :success
  end

  test "should get update" do
    get adimn_orders_update_url
    assert_response :success
  end
end
