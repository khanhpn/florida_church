require "test_helper"

class Admin::FuneralControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_funeral_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_funeral_new_url
    assert_response :success
  end
end
