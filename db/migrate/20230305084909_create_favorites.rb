class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      
      # FK
      t.string :user_id, null: false
      t.string :review_comment, null: false

      t.timestamps
    end
  end
end
