class Book < ApplicationRecord
  validates :title, :author_first, :author_last, presence: true
end
