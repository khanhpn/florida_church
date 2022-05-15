require "test_helper"

class ClergyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clergy_index_url
    assert_response :success
  end
end
