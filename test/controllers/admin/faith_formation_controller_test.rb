require "test_helper"

class Admin::FaithFormationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_faith_formation_index_url
    assert_response :success
  end
end
