class Game < ApplicationRecord
  belongs_to :system
  has_many :game_logs

  validates :title, presence: true

  enum status: %i[priority in_progress complete abandoned]

  def sort_string
    [series, order, title].join('')
  end
end
