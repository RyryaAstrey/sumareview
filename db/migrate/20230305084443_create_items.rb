class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      # FK
      t.integer :operation_system_id
      t.integer :central_processing_unit_id
      t.integer :authentication_id
      t.integer :spec_id
      t.integer :maker_id
      t.integer :capacity_id
      
      # 文字列
      t.string :name
      t.text :explanation
      t.text :strength
      t.text :weakness
      t.string :core
      t.string :main_camera
      t.string :in_camera
      t.string :mobile_wallet
      t.string :release_date
      
      # 数値
      t.integer :price
      t.integer :battery
      t.float :display
      t.float :weight
      t.float :height
      t.float :width
      t.float :thickness
      t.integer :memory
      
      # enumで管理
      t.integer :waterploof, null: false, default: 0 # 0:〇、1:×
      t.integer :wireless_chage, null: false, default: 0 # 0:〇、1:×
      t.integer :near_field_communication, null: false, default: 0 # 0:〇、1:×
      
      # ステータス
      t.boolean :is_draft, null: false, default: false #公開ステータス（下書き用）
      
      t.timestamps
    end
  end
end
