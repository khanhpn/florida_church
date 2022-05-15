require "test_helper"

class Admin::MarriageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_marriage_index_url
    assert_response :success
  end
end
