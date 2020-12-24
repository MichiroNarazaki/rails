require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "name",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'#登録ページのまま
    assert_select ".form-control", 4,'There are not 4th classes of form-control.'
  end
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post users_path, params: { user: { name:  "Example Name",
                                         email: "Example_Name@valid.com",
                                         password:              "thisissample",
                                         password_confirmation: "thisissample" } }
    end
    follow_redirect!
    assert_template 'users/show'#登録完了したのでユーザページへ
    assert_not flash.blank? ,"flash is blank"
    assert is_logged_in?
    # assert_select ".alert", "Welcome to the Sample App!"
  end
end