require "test_helper"

class Admin::EcuharisticMinistryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_ecuharistic_ministry_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_ecuharistic_ministry_new_url
    assert_response :success
  end
end
