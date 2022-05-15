require "test_helper"

class Admin::ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_children_index_url
    assert_response :success
  end
end
