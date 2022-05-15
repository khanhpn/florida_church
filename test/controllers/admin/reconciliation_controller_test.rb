require "test_helper"

class Admin::ReconciliationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_reconciliation_index_url
    assert_response :success
  end
end
