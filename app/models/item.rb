class Item < ApplicationRecord
  
  has_one_attached :image
  has_many :comments, dependent: :destroy
  belongs_to :operation_system, optional: true
  belongs_to :spec, optional: true
  belongs_to :authentication, optional: true
  belongs_to :maker, optional: true
  belongs_to :central_processing_unit, optional: true
  belongs_to :capacity, optional: true
  
  # バリデーション
  with_options presence: true, on: :publicize do
    validates :operation_system
    validates :spec
    validates :authentication
    validates :maker
    validates :central_processing_unit
    validates :capacity
    validates :name
    validates :explanation
    validates :strength
    validates :weakness
    validates :core
    validates :main_camera
    validates :in_camera
    validates :mobile_wallet
    validates :release_date
    validates :price
    validates :battery
    validates :display
    validates :weight
    validates :height
    validates :width
    validates :thickness
    validates :memory
  end
  
  # enum
  enum waterploof: { "water_true": 0, "water_false": 1 }
  enum near_field_communication: { "near_true": 0, "near_false": 1 }
  enum wireless_chage: { "wireless_true": 0, "wireless_false": 1 }
  
  # メソッド
  
  ## 画像がなかった場合にno_imageを表示する
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
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
