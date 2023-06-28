require "test_helper"

class Admin::CartridgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cartridge = cartridges(:one)
  end

  test "should get index" do
    get admin_cartridges_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_cartridge_url
    assert_response :success
  end

  test "should create cartridge" do
    assert_difference("Cartridge.count") do
      post admin_cartridges_url, params: {cartridge: {build: @cartridge.build, code: @cartridge.code, game_id: @cartridge.game_id, game_version: @cartridge.game_version, revision: @cartridge.revision, region: @cartridge.region}}
    end

    assert_redirected_to admin_cartridge_url(Cartridge.last)
  end

  test "should show cartridge" do
    get admin_cartridge_url(@cartridge)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_cartridge_url(@cartridge)
    assert_response :success
  end

  test "should update cartridge" do
    patch admin_cartridge_url(@cartridge), params: {cartridge: {build: @cartridge.build, code: @cartridge.code, game_id: @cartridge.game_id, game_version: @cartridge.game_version, revision: @cartridge.revision, region: @cartridge.region}}
    assert_redirected_to admin_cartridge_url(@cartridge)
  end

  test "should destroy cartridge" do
    assert_difference("Cartridge.count", -1) do
      delete admin_cartridge_url(@cartridge)
    end

    assert_redirected_to admin_cartridges_url
  end
end
