require 'test_helper'

class Secret::ProducerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get secret_producer_show_url
    assert_response :success
  end

end
