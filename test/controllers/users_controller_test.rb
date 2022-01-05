require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @token = authenticated_header(@user)
  end

  test "should get index" do
    get users_url, headers: @token,as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, headers: @token, params: { name: "Darth Vader", username: "darth_vader", password: '12345678', password_confirmation: '12345678' }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(_username: @user.username), headers: @token, as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(_username: @user.username), headers: @token, params: { name: "Darth Vader updated", username: "darth_vader", password: '12345678', password_confirmation: '12345678' }, as: :json
    assert_response 204
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(_username: @user.username), headers: @token, as: :json
    end

    assert_response 204
  end
end
