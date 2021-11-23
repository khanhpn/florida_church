require "test_helper"

class Admin::AltarSocietyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_altar_society_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_altar_society_new_url
    assert_response :success
  end
end
