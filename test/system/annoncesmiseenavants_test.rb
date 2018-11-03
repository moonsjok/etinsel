require "application_system_test_case"

class AnnoncesmiseenavantsTest < ApplicationSystemTestCase
  setup do
    @annoncesmiseenavant = annoncesmiseenavants(:one)
  end

  test "visiting the index" do
    visit annoncesmiseenavants_url
    assert_selector "h1", text: "Annoncesmiseenavants"
  end

  test "creating a Annoncesmiseenavant" do
    visit annoncesmiseenavants_url
    click_on "New Annoncesmiseenavant"

    fill_in "Annonce", with: @annoncesmiseenavant.annonce_id
    click_on "Create Annoncesmiseenavant"

    assert_text "Annoncesmiseenavant was successfully created"
    click_on "Back"
  end

  test "updating a Annoncesmiseenavant" do
    visit annoncesmiseenavants_url
    click_on "Edit", match: :first

    fill_in "Annonce", with: @annoncesmiseenavant.annonce_id
    click_on "Update Annoncesmiseenavant"

    assert_text "Annoncesmiseenavant was successfully updated"
    click_on "Back"
  end

  test "destroying a Annoncesmiseenavant" do
    visit annoncesmiseenavants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Annoncesmiseenavant was successfully destroyed"
  end
end
