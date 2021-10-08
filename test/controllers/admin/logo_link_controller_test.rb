require "test_helper"

class Admin::LogoLinkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_logo_link_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_logo_link_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_logo_link_edit_url
    assert_response :success
  end
end
