require "test_helper"

class KnightColumbControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get knight_columb_index_url
    assert_response :success
  end
end
