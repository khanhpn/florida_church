require "test_helper"

class Admin::ChildrenLiturgyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_children_liturgy_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_children_liturgy_new_url
    assert_response :success
  end
end
