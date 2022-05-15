require "test_helper"

class Admin::HistoryChurchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_history_church_index_url
    assert_response :success
  end
end
