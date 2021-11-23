require "test_helper"

class TeachingMassControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teaching_mass_index_url
    assert_response :success
  end
end
