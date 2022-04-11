require "test_helper"

class ChildrenYouthControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get children_youth_index_url
    assert_response :success
  end
end
