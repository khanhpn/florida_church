require "test_helper"

class Admin::ClergyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_clergy_index_url
    assert_response :success
  end
end
