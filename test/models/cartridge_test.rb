require "test_helper"

class CartridgeTest < ActiveSupport::TestCase
  test "valid cartridge is saved" do
    game = games(:one)
    cartridge = Cartridge.new(code: "AB34", build: "A", revision: "123", region: Cartridge.regions[:jpn], game_version: "1.0.0", game_id: game.id)

    assert cartridge.valid?
  end

  test "code is exactly 4 characters long" do
    cartridge_a = Cartridge.new(code: "12345")
    cartridge_b = Cartridge.new(code: "123")

    cartridge_a.valid?
    cartridge_b.valid?

    assert_equal ["is the wrong length (should be 4 characters)"], cartridge_a.errors[:code]
    assert_equal ["is the wrong length (should be 4 characters)"], cartridge_b.errors[:code]
  end

  test "build is exactly 1 character long" do
    cartridge_a = Cartridge.new(build: "AB")

    cartridge_a.valid?

    assert_equal ["is the wrong length (should be 1 character)"], cartridge_a.errors[:build]
  end

  test "build is a capitalized letter" do
    cartridge_a = Cartridge.new(build: "a")
    cartridge_b = Cartridge.new(build: "1")

    cartridge_a.valid?
    cartridge_b.valid?

    assert_equal ["is not a capitalized letter"], cartridge_a.errors[:build]
    assert_equal ["is not a capitalized letter"], cartridge_b.errors[:build]
  end

  test "revision is exactly 3 characters long" do
    cartridge_a = Cartridge.new(revision: "12")
    cartridge_b = Cartridge.new(revision: "1234")

    cartridge_a.valid?
    cartridge_b.valid?

    assert_equal ["is the wrong length (should be 3 characters)"], cartridge_a.errors[:revision]
    assert_equal ["is the wrong length (should be 3 characters)"], cartridge_b.errors[:revision]
  end

  test "revision is only numbers" do
    cartridge_a = Cartridge.new(revision: "abc")
    cartridge_b = Cartridge.new(revision: "1a2")

    cartridge_a.valid?
    cartridge_b.valid?

    assert_equal ["is not a number"], cartridge_a.errors[:revision]
    assert_equal ["is not a number"], cartridge_b.errors[:revision]
  end

  test "region is present" do
    cartridge = Cartridge.new(region: "")

    cartridge.valid?

    assert_equal ["can't be blank"], cartridge.errors[:region]
  end

  test "region is either USA, JPN, EUR, or AUS" do
    assert_raises ArgumentError do
      Cartridge.new(region: "ABC")
    end
  end

  test "game version is present" do
    cartridge = Cartridge.new(game_version: "")

    cartridge.valid?

    assert_equal ["can't be blank"], cartridge.errors[:game_version]
  end
end
