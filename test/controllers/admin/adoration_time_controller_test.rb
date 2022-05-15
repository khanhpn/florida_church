require "test_helper"

class Admin::AdorationTimeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_adoration_time_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_adoration_time_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_adoration_time_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_adoration_time_show_url
    assert_response :success
  end
end
