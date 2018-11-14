require "application_system_test_case"

class PublicitesTest < ApplicationSystemTestCase
  setup do
    @publicite = publicites(:one)
  end

  test "visiting the index" do
    visit publicites_url
    assert_selector "h1", text: "Publicites"
  end

  test "creating a Publicite" do
    visit publicites_url
    click_on "New Publicite"

    fill_in "Duree", with: @publicite.duree
    fill_in "Entreprise", with: @publicite.entreprise
    fill_in "Resolution", with: @publicite.resolution
    click_on "Create Publicite"

    assert_text "Publicite was successfully created"
    click_on "Back"
  end

  test "updating a Publicite" do
    visit publicites_url
    click_on "Edit", match: :first

    fill_in "Duree", with: @publicite.duree
    fill_in "Entreprise", with: @publicite.entreprise
    fill_in "Resolution", with: @publicite.resolution
    click_on "Update Publicite"

    assert_text "Publicite was successfully updated"
    click_on "Back"
  end

  test "destroying a Publicite" do
    visit publicites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Publicite was successfully destroyed"
  end
end
