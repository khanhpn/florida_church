require "test_helper"

class Admin::EnvironmentChurchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_environment_church_index_url
    assert_response :success
  end
end
