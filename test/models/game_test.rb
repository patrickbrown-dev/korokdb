require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "title is present" do
    game = Game.new

    game.save

    assert_equal ["can't be blank"], game.errors[:title]
  end
end
