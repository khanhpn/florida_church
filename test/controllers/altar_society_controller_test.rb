require "test_helper"

class AltarSocietyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get altar_society_index_url
    assert_response :success
  end
end
