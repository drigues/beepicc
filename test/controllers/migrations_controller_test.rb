require "test_helper"

class MigrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get run" do
    get migrations_run_url
    assert_response :success
  end
end
