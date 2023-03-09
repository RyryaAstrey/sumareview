class Authentication < ApplicationRecord
  
  validates :name, presence: true
end
