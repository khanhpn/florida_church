require "test_helper"

class Admin::MassControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_mass_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_mass_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_mass_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_mass_show_url
    assert_response :success
  end
end
