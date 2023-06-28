require "test_helper"

class Admin::GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get admin_games_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_game_url
    assert_response :success
  end

  test "should create game" do
    assert_difference("Game.count") do
      post admin_games_url, params: {game: {title: @game.title}}
    end

    assert_redirected_to admin_game_url(Game.last)
  end

  test "should show game" do
    get admin_game_url(@game)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_game_url(@game)
    assert_response :success
  end

  test "should update game" do
    patch admin_game_url(@game), params: {game: {title: @game.title}}
    assert_redirected_to admin_game_url(@game)
  end

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete admin_game_url(@game)
    end

    assert_redirected_to admin_games_url
  end
end
