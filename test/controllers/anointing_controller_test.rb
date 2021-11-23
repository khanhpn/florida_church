require "test_helper"

class AnointingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get anointing_index_url
    assert_response :success
  end
end
