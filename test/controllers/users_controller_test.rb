require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user2 = users(:two)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end
  
  test "should get new" do
    get signup_path
    assert_response :success
  end
  
#########################################
###validateひっかかるとエラー出る
test "should create user" do
  assert_difference('User.count') do
    # post users_url, params: { user: { email: "abc@a.com", name: "sample sample" ,password_digest: "sinvsbvjjv;bjasvj;s;anvj;n"} }
    # post users_url, params: { user: { email: @user2.email, name: @user2.name ,password: @user2.password_digest } }
    post users_url, params: { user: { email: "thisismail@sample.com", name: @user2.name ,password: @user2.password_digest } }
  end
  assert_redirected_to user_url(User.last)
end
#########################################

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end
  
  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name ,password: @user.password_digest } }
    # patch user_url(@user), params: { user: { email: "update_email@a.com", name: "update_name",password_digest: @user.password_digest } }
    assert_redirected_to user_url(@user)
  end
test "should destroy user" do
  assert_difference('User.count', -1) do
    delete user_url(@user)
  end

    assert_redirected_to users_url
  end
end
