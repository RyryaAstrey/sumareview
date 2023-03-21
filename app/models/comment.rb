class Comment < ApplicationRecord
  
  # アソシエーション
  has_many :favorites, dependent: :destroy
  belongs_to :item
  belongs_to :user
  
  # バリデーション
  with_options presence: true do
    validates :comment
    validates :score, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than: 101
    }
  end
  
  #メソッド
  
  ## コメント済みのユーザーかどうか確認するメソッド
  def finished_by?(user)
    Comment.exists?(user_id: user.id)
  end
  
  ## 参考になったがされているかどうか確認するメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
