require "application_system_test_case"

class DiscussionsTest < ApplicationSystemTestCase
  setup do
    @discussion = discussions(:one)
  end

  test "visiting the index" do
    visit discussions_url
    assert_selector "h1", text: "Discussions"
  end

  test "should create discussion" do
    visit discussions_url
    click_on "New discussion"

    fill_in "Content", with: @discussion.content
    click_on "Create Discussion"

    assert_text "Discussion was successfully created"
    click_on "Back"
  end

  test "should update Discussion" do
    visit discussion_url(@discussion)
    click_on "Edit this discussion", match: :first

    fill_in "Content", with: @discussion.content
    click_on "Update Discussion"

    assert_text "Discussion was successfully updated"
    click_on "Back"
  end

  test "should destroy Discussion" do
    visit discussion_url(@discussion)
    click_on "Destroy this discussion", match: :first

    assert_text "Discussion was successfully destroyed"
  end
end
