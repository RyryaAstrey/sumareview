class Maker < ApplicationRecord
  
  validates :name, presence: true
  
  # メーカー名を検索する
  def self.search(search)
    if search != ""
      Maker.where('name LIKE(?)', "%#{search}%")
    else
      Maker.all
    end
  end
end
