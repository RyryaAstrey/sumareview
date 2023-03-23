class Item < ApplicationRecord
  
  has_many_attached :images
  has_many :comments, dependent: :destroy
  belongs_to :operation_system, optional: true
  belongs_to :spec, optional: true
  belongs_to :authentication, optional: true
  belongs_to :maker, optional: true
  belongs_to :central_processing_unit, optional: true
  belongs_to :capacity, optional: true
  
  # バリデーション
  validates :name, presence: true, uniqueness: true #機種名のみ入力しないと下書き保存ができないように設定
  with_options presence: true, on: :publicize do
    validates :images
    validates :operation_system
    validates :spec
    validates :authentication
    validates :maker
    validates :central_processing_unit
    validates :capacity
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
  
  ## レビュースコアの平均点を計算するメソッド
  def review_score_average
    if comments.presence # コメントがある時
      comments.average(:score).to_i.round # スコアの平均点を出し、to_iで整数化し、小数点をroundeで取り除く
    else
      0
    end
  end
  ## --ここまで平均点計算メソッド--
  
  ## ソート用メソッド
    scope :latest, -> {order(release_date: :desc)}
    scope :old, -> {order(release_date: :asc)} #未使用　発売日の古い順
    scope :high_cost, -> {order(price: :desc)} #未使用　価格の高い順
    scope :row_cost, -> {order(price: :asc)}
  
end
