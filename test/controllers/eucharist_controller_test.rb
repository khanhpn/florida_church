require "test_helper"

class EucharistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eucharist_index_url
    assert_response :success
  end
end
