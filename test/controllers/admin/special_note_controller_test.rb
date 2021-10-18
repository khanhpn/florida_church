require "test_helper"

class Admin::SpecialNoteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_special_note_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_special_note_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_special_note_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_special_note_show_url
    assert_response :success
  end
end
