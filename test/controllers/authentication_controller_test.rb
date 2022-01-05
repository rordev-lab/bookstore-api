require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get token" do
    get auth_login_url, params:{username: @user.username, password: '12345678'}, as: :json
    assert_response :success
  end  
end
