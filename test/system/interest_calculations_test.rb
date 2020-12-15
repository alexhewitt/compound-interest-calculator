require "application_system_test_case"

class InterestCalculationsTest < ApplicationSystemTestCase
  setup do
    @interest_calculation = interest_calculations(:one)
  end

  test "visiting the index" do
    visit interest_calculations_url
    assert_selector "h1", text: "Interest Calculations"
  end

  test "creating a Interest calculation" do
    visit interest_calculations_url
    click_on "New Interest Calculation"

    click_on "Create Interest calculation"

    assert_text "Interest calculation was successfully created"
    click_on "Back"
  end

  test "updating a Interest calculation" do
    visit interest_calculations_url
    click_on "Edit", match: :first

    click_on "Update Interest calculation"

    assert_text "Interest calculation was successfully updated"
    click_on "Back"
  end

  test "destroying a Interest calculation" do
    visit interest_calculations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interest calculation was successfully destroyed"
  end
end
