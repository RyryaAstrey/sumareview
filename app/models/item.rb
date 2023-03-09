class Item < ApplicationRecord
  
  has_one_attached :image
  
  # バリデーション
  validates :name, presence: true
  validates :explanation, presence: true
  validates :strength, presence: true
  validates :weakness, presence: true
  validates :core, presence: true
  validates :mein_camera, presence: true
  validates :in_camera, presence: true
  validates :mobile_wallet, presence: true
  validates :release_date, presence: true
  validates :price, presence: true
  validates :battery, presence: true
  validates :display, presence: true
  validates :weight, presence: true
  validates :height, presence: true
  validates :width, presence: true
  validates :thickness, presence: true
  validates :memory, presence: true
  
  # enum
  enum waterploof: { "water_true": 0, "water_false": 1 }
  enum near_field_communication: { "near_true": 0, "near_false": 1 }
  enum wireless_chage: { "wireless_true": 0, "wireless_false": 1 }
  
  # メソッド
  
  ## 画像がなかった場合にno_imageを表示する
  def get_image
    (image.attached?) ? image : 'no_image_jpg'
  end
  
  ## 機種名を検索する
  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
