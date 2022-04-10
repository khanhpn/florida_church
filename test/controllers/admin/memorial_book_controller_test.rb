require "test_helper"

class Admin::MemorialBookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_memorial_book_index_url
    assert_response :success
  end
end
