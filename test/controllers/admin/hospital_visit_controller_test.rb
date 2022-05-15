require "test_helper"

class Admin::HospitalVisitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_hospital_visit_index_url
    assert_response :success
  end
end
