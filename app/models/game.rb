class Game < ApplicationRecord
  has_many :cartridges, dependent: :destroy

  validates :title, presence: true
end
