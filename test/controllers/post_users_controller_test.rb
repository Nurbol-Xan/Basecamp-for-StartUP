require "test_helper"

class PostUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_user = post_users(:one)
  end

  test "should get index" do
    get post_users_url
    assert_response :success
  end

  test "should get new" do
    get new_post_user_url
    assert_response :success
  end

  test "should create post_user" do
    assert_difference("PostUser.count") do
      post post_users_url, params: { post_user: { content: @post_user.content } }
    end

    assert_redirected_to post_user_url(PostUser.last)
  end

  test "should show post_user" do
    get post_user_url(@post_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_user_url(@post_user)
    assert_response :success
  end

  test "should update post_user" do
    patch post_user_url(@post_user), params: { post_user: { content: @post_user.content } }
    assert_redirected_to post_user_url(@post_user)
  end

  test "should destroy post_user" do
    assert_difference("PostUser.count", -1) do
      delete post_user_url(@post_user)
    end

    assert_redirected_to post_users_url
  end
end
