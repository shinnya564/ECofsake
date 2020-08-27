require 'test_helper'

class Admins::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_products_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_products_show_url
    assert_response :success
  end

end
