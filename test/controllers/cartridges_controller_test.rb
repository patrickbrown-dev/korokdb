require "test_helper"

class CartridgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cartridge = cartridges(:one)
  end

  test "should get index" do
    get cartridges_url
    assert_response :success
  end

  test "should get new" do
    get new_cartridge_url
    assert_response :success
  end

  test "should create cartridge" do
    assert_difference("Cartridge.count") do
      post cartridges_url, params: { cartridge: { build: @cartridge.build, code: @cartridge.code, game_id: @cartridge.game_id, game_version: @cartridge.game_version, revision: @cartridge.revision, region: @cartridge.region } }
    end

    assert_redirected_to cartridge_url(Cartridge.last)
  end

  test "should show cartridge" do
    get cartridge_url(@cartridge)
    assert_response :success
  end

  test "should get edit" do
    get edit_cartridge_url(@cartridge)
    assert_response :success
  end

  test "should update cartridge" do
    patch cartridge_url(@cartridge), params: { cartridge: { build: @cartridge.build, code: @cartridge.code, game_id: @cartridge.game_id, game_version: @cartridge.game_version, revision: @cartridge.revision, region: @cartridge.region } }
    assert_redirected_to cartridge_url(@cartridge)
  end

  test "should destroy cartridge" do
    assert_difference("Cartridge.count", -1) do
      delete cartridge_url(@cartridge)
    end

    assert_redirected_to cartridges_url
  end
end
