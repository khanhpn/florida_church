require "test_helper"

class EcuharisticMinistryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ecuharistic_ministry_index_url
    assert_response :success
  end
end
