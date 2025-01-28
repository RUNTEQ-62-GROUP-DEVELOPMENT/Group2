require "application_system_test_case"

class OwlsTest < ApplicationSystemTestCase
  setup do
    @owl = owls(:one)
  end

  test "visiting the index" do
    visit owls_url
    assert_selector "h1", text: "Owls"
  end

  test "should create owl" do
    visit owls_url
    click_on "New owl"

    fill_in "Age", with: @owl.age
    fill_in "Name", with: @owl.name
    click_on "Create Owl"

    assert_text "Owl was successfully created"
    click_on "Back"
  end

  test "should update Owl" do
    visit owl_url(@owl)
    click_on "Edit this owl", match: :first

    fill_in "Age", with: @owl.age
    fill_in "Name", with: @owl.name
    click_on "Update Owl"

    assert_text "Owl was successfully updated"
    click_on "Back"
  end

  test "should destroy Owl" do
    visit owl_url(@owl)
    click_on "Destroy this owl", match: :first

    assert_text "Owl was successfully destroyed"
  end
end
