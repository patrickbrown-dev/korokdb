require "application_system_test_case"

class CartridgesTest < ApplicationSystemTestCase
  setup do
    @cartridge = cartridges(:one)
  end

  test "visiting the index" do
    visit cartridges_url
    assert_selector "h1", text: "Cartridges"
  end

  test "should create cartridge" do
    visit cartridges_url
    click_on "New cartridge"

    fill_in "Build", with: @cartridge.build
    fill_in "Code", with: @cartridge.code
    fill_in "Game", with: @cartridge.game_id
    fill_in "Game version", with: @cartridge.game_version
    fill_in "Revision", with: @cartridge.revision
    click_on "Create Cartridge"

    assert_text "Cartridge was successfully created"
    click_on "Back"
  end

  test "should update Cartridge" do
    visit cartridge_url(@cartridge)
    click_on "Edit this cartridge", match: :first

    fill_in "Build", with: @cartridge.build
    fill_in "Code", with: @cartridge.code
    fill_in "Game", with: @cartridge.game_id
    fill_in "Game version", with: @cartridge.game_version
    fill_in "Revision", with: @cartridge.revision
    click_on "Update Cartridge"

    assert_text "Cartridge was successfully updated"
    click_on "Back"
  end

  test "should destroy Cartridge" do
    visit cartridge_url(@cartridge)
    click_on "Destroy this cartridge", match: :first

    assert_text "Cartridge was successfully destroyed"
  end
end
