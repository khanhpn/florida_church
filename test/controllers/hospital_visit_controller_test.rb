require "test_helper"

class HospitalVisitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hospital_visit_index_url
    assert_response :success
  end
end
