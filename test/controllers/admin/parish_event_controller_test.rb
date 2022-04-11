require "test_helper"

class Admin::ParishEventControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_parish_event_index_url
    assert_response :success
  end
end
