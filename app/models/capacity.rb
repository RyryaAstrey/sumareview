class Capacity < ApplicationRecord
  
  has_many :items
  
  # validates :name, presence: true, on: :publicize
end
