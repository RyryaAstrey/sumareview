class Spec < ApplicationRecord
  
  has_many :items
  
  validates :name, presence: true, uniqueness: true
  
end
