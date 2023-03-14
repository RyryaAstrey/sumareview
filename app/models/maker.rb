class Maker < ApplicationRecord
  
  has_many :items
  
  validates :name, presence: true
  
  # メーカー名を検索する
  def self.search(search)
    if search != ""
      Maker.where('name LIKE(?)', "%#{search}%")
    else
      Maker.all
    end
  end
  
  # ransackのホワイトリスト（検索対象のカラムを入力）
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
