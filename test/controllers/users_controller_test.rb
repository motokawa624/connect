require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get index" do
    get users_index_url
    assert_response :success
  end

    test "should update user" do
    get users_index_url
    assert_response :success
    patch user_url(@user), params: { user: { name: @user.name, place: @user.place, introduction: @user.introduction, , profile_image_id: @user.profile_image_id } }
    assert_redirected_to book_url(@book)
  end
end
