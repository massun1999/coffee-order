require "application_system_test_case"

class LattesTest < ApplicationSystemTestCase
  setup do
    @latte = lattes(:one)
  end

  test "visiting the index" do
    visit lattes_url
    assert_selector "h1", text: "Lattes"
  end

  test "creating a Latte" do
    visit lattes_url
    click_on "New Latte"

    click_on "Create Latte"

    assert_text "Latte was successfully created"
    click_on "Back"
  end

  test "updating a Latte" do
    visit lattes_url
    click_on "Edit", match: :first

    click_on "Update Latte"

    assert_text "Latte was successfully updated"
    click_on "Back"
  end

  test "destroying a Latte" do
    visit lattes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Latte was successfully destroyed"
  end
end
