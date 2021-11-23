require "test_helper"

class Admin::UshersHospitalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_ushers_hospital_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_ushers_hospital_new_url
    assert_response :success
  end
end
