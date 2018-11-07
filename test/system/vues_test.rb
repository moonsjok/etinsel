require "application_system_test_case"

class VuesTest < ApplicationSystemTestCase
  setup do
    @vue = vues(:one)
  end

  test "visiting the index" do
    visit vues_url
    assert_selector "h1", text: "Vues"
  end

  test "creating a Vue" do
    visit vues_url
    click_on "New Vue"

    fill_in "Annonce", with: @vue.annonce_id
    fill_in "Pays", with: @vue.pays
    fill_in "Quartier", with: @vue.quartier
    fill_in "User", with: @vue.user_id
    fill_in "Ville", with: @vue.ville
    click_on "Create Vue"

    assert_text "Vue was successfully created"
    click_on "Back"
  end

  test "updating a Vue" do
    visit vues_url
    click_on "Edit", match: :first

    fill_in "Annonce", with: @vue.annonce_id
    fill_in "Pays", with: @vue.pays
    fill_in "Quartier", with: @vue.quartier
    fill_in "User", with: @vue.user_id
    fill_in "Ville", with: @vue.ville
    click_on "Update Vue"

    assert_text "Vue was successfully updated"
    click_on "Back"
  end

  test "destroying a Vue" do
    visit vues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vue was successfully destroyed"
  end
end
