require "test_helper"

class Admin::IntroductionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_introduction_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_introduction_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_introduction_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_introduction_edit_url
    assert_response :success
  end
end
