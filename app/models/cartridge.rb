class Cartridge < ApplicationRecord
  belongs_to :game

  enum region: { usa: "USA", jpn: "JPN", eur: "EUR", aus: "AUS" }

  validates :code, length: { is: 4 }
  validates :build, length: { is: 1 }
  validates :build, format: { with: /\A[A-Z]+\z/, message: "is not a capitalized letter" }
  validates :revision, length: { is: 3 }
  validates :revision, numericality: { only_integer: true }
  validates :region, presence: true
  validates :game_version, presence: true
end
