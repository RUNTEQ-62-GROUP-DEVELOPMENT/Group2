require "application_system_test_case"

class HedgehogsTest < ApplicationSystemTestCase
  setup do
    @hedgehog = hedgehogs(:one)
  end

  test "visiting the index" do
    visit hedgehogs_url
    assert_selector "h1", text: "Hedgehogs"
  end

  test "should create hedgehog" do
    visit hedgehogs_url
    click_on "New hedgehog"

    fill_in "Age", with: @hedgehog.age
    fill_in "Name", with: @hedgehog.name
    click_on "Create Hedgehog"

    assert_text "Hedgehog was successfully created"
    click_on "Back"
  end

  test "should update Hedgehog" do
    visit hedgehog_url(@hedgehog)
    click_on "Edit this hedgehog", match: :first

    fill_in "Age", with: @hedgehog.age
    fill_in "Name", with: @hedgehog.name
    click_on "Update Hedgehog"

    assert_text "Hedgehog was successfully updated"
    click_on "Back"
  end

  test "should destroy Hedgehog" do
    visit hedgehog_url(@hedgehog)
    click_on "Destroy this hedgehog", match: :first

    assert_text "Hedgehog was successfully destroyed"
  end
end
