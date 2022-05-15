require "test_helper"

class ChildrenLiturgyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get children_liturgy_index_url
    assert_response :success
  end
end
