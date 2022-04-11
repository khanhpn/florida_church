require "test_helper"

class ParishEventControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parish_event_index_url
    assert_response :success
  end
end
