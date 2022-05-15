require "test_helper"

class AdultControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adult_index_url
    assert_response :success
  end
end
