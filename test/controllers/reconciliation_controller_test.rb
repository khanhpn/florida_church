require "test_helper"

class ReconciliationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reconciliation_index_url
    assert_response :success
  end
end
