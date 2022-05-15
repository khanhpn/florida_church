require "test_helper"

class Admin::ChildrenYouthControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_children_youth_index_url
    assert_response :success
  end
end
