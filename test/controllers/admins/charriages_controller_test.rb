require 'test_helper'

class Admins::CharriagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_charriages_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_charriages_edit_url
    assert_response :success
  end

end
