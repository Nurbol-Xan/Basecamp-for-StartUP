require "application_system_test_case"

class PostUsersTest < ApplicationSystemTestCase
  setup do
    @post_user = post_users(:one)
  end

  test "visiting the index" do
    visit post_users_url
    assert_selector "h1", text: "Post users"
  end

  test "should create post user" do
    visit post_users_url
    click_on "New post user"

    fill_in "Content", with: @post_user.content
    click_on "Create Post user"

    assert_text "Post user was successfully created"
    click_on "Back"
  end

  test "should update Post user" do
    visit post_user_url(@post_user)
    click_on "Edit this post user", match: :first

    fill_in "Content", with: @post_user.content
    click_on "Update Post user"

    assert_text "Post user was successfully updated"
    click_on "Back"
  end

  test "should destroy Post user" do
    visit post_user_url(@post_user)
    click_on "Destroy this post user", match: :first

    assert_text "Post user was successfully destroyed"
  end
end
