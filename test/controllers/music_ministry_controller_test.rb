require "test_helper"

class MusicMinistryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get music_ministry_index_url
    assert_response :success
  end
end
