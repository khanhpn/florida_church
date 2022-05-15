require "test_helper"

class MemorialBookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get memorial_book_index_url
    assert_response :success
  end
end
