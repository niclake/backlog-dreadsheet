class GameLog < ApplicationRecord
  belongs_to :game

  validates(
    :date,
    :hours,
    presence: true
  )
end