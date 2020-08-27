require 'test_helper'

class Admins::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_orders_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_orders_edit_url
    assert_response :success
  end

end
