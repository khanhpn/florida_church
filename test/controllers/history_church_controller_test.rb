require "test_helper"

class HistoryChurchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get history_church_index_url
    assert_response :success
  end
end
