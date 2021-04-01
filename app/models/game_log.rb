class GameLog < ApplicationRecord
  belongs_to :game

  validates(
    :completion_date,
    presence: true
  )
end