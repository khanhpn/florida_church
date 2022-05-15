require "test_helper"

class UshersHospitalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ushers_hospital_index_url
    assert_response :success
  end
end
