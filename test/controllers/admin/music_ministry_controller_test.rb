require "test_helper"

class Admin::MusicMinistryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_music_ministry_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_music_ministry_new_url
    assert_response :success
  end
end
