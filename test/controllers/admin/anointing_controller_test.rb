require "test_helper"

class Admin::AnointingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_anointing_index_url
    assert_response :success
  end
end
