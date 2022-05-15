require "test_helper"

class Admin::BulletinControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_bulletin_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_bulletin_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_bulletin_edit_url
    assert_response :success
  end
end
