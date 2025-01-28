require "application_system_test_case"

class ChicksTest < ApplicationSystemTestCase
  setup do
    @chick = chicks(:one)
  end

  test "visiting the index" do
    visit chicks_url
    assert_selector "h1", text: "Chicks"
  end

  test "should create chick" do
    visit chicks_url
    click_on "New chick"

    fill_in "Age", with: @chick.age
    fill_in "Name", with: @chick.name
    click_on "Create Chick"

    assert_text "Chick was successfully created"
    click_on "Back"
  end

  test "should update Chick" do
    visit chick_url(@chick)
    click_on "Edit this chick", match: :first

    fill_in "Age", with: @chick.age
    fill_in "Name", with: @chick.name
    click_on "Update Chick"

    assert_text "Chick was successfully updated"
    click_on "Back"
  end

  test "should destroy Chick" do
    visit chick_url(@chick)
    click_on "Destroy this chick", match: :first

    assert_text "Chick was successfully destroyed"
  end
end
