require "test_helper"

class FaithFormationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get faith_formation_index_url
    assert_response :success
  end
end
