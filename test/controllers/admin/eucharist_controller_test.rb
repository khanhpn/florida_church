require "test_helper"

class Admin::EucharistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_eucharist_index_url
    assert_response :success
  end
end
