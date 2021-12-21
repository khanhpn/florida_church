require "test_helper"

class EnvironmentChurchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get environment_church_index_url
    assert_response :success
  end
end
