require "application_system_test_case"

class RailsTutorialsTest < ApplicationSystemTestCase
  setup do
    @rails_tutorial = rails_tutorials(:one)
  end

  test "visiting the index" do
    visit rails_tutorials_url
    assert_selector "h1", text: "Rails tutorials"
  end

  test "should create rails tutorial" do
    visit rails_tutorials_url
    click_on "New rails tutorial"

    fill_in "Email", with: @rails_tutorial.email
    fill_in "First name", with: @rails_tutorial.first_name
    fill_in "Last name", with: @rails_tutorial.last_name
    fill_in "Phone", with: @rails_tutorial.phone
    fill_in "Twitter", with: @rails_tutorial.twitter
    click_on "Create Rails tutorial"

    assert_text "Rails tutorial was successfully created"
    click_on "Back"
  end

  test "should update Rails tutorial" do
    visit rails_tutorial_url(@rails_tutorial)
    click_on "Edit this rails tutorial", match: :first

    fill_in "Email", with: @rails_tutorial.email
    fill_in "First name", with: @rails_tutorial.first_name
    fill_in "Last name", with: @rails_tutorial.last_name
    fill_in "Phone", with: @rails_tutorial.phone
    fill_in "Twitter", with: @rails_tutorial.twitter
    click_on "Update Rails tutorial"

    assert_text "Rails tutorial was successfully updated"
    click_on "Back"
  end

  test "should destroy Rails tutorial" do
    visit rails_tutorial_url(@rails_tutorial)
    click_on "Destroy this rails tutorial", match: :first

    assert_text "Rails tutorial was successfully destroyed"
  end
end
