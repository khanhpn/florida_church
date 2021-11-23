require "test_helper"

class Admin::TeachingMassControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_teaching_mass_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_teaching_mass_new_url
    assert_response :success
  end
end
