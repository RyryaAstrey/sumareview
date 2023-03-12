class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user
  
  with_options presence: true do
    validates :comment
    validates :score, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1,
      less_than: 101
    }
  end
end
