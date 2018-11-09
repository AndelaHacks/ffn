require "application_system_test_case"

class FfnisTest < ApplicationSystemTestCase
  setup do
    @ffni = ffnis(:one)
  end

  test "visiting the index" do
    visit ffnis_url
    assert_selector "h1", text: "Ffnis"
  end

  test "creating a Ffni" do
    visit ffnis_url
    click_on "New Ffni"

    fill_in "Badge", with: @ffni.badge
    fill_in "Content", with: @ffni.content
    fill_in "Downvotes", with: @ffni.downvotes
    fill_in "Media", with: @ffni.media
    fill_in "Topic", with: @ffni.topic
    fill_in "Upvotes", with: @ffni.upvotes
    fill_in "User", with: @ffni.user_id
    click_on "Create Ffni"

    assert_text "Ffni was successfully created"
    click_on "Back"
  end

  test "updating a Ffni" do
    visit ffnis_url
    click_on "Edit", match: :first

    fill_in "Badge", with: @ffni.badge
    fill_in "Content", with: @ffni.content
    fill_in "Downvotes", with: @ffni.downvotes
    fill_in "Media", with: @ffni.media
    fill_in "Topic", with: @ffni.topic
    fill_in "Upvotes", with: @ffni.upvotes
    fill_in "User", with: @ffni.user_id
    click_on "Update Ffni"

    assert_text "Ffni was successfully updated"
    click_on "Back"
  end

  test "destroying a Ffni" do
    visit ffnis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ffni was successfully destroyed"
  end
end
