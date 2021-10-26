require "test_helper"

class BulletinControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bulletin_index_url
    assert_response :success
  end
end
