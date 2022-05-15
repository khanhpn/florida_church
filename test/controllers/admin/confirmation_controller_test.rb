require "test_helper"

class Admin::ConfirmationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_confirmation_index_url
    assert_response :success
  end
end
