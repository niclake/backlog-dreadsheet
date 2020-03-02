class Game < ApplicationRecord
  belongs_to :system
  belongs_to :status, optional: true

  validates :title, presence: true
end
