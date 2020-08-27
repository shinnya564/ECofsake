require 'test_helper'

class Admins::AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admins_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_admins_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_admins_edit_url
    assert_response :success
  end

end
