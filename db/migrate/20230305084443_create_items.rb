class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      # FK
      t.integer :operation_system_id, null: false
      t.integer :central_processing_unit_id, null: false
      t.integer :certification_id, null: false
      t.integer :spec_id, null: false
      t.integer :maker_id, null: false
      t.integer :capacity_id, null: false
      
      # 文字列
      t.string :name, null: false
      t.text :explanation, null: false
      t.text :strength, null: false
      t.text :weakness, null: false
      t.string :core, null: false
      t.string :mein_camera, null: false
      t.string :in_camera, null: false
      t.string :mobile_wallet, null: false
      t.string :release_date, null: false
      
      # 数値
      t.integer :price, null: false
      t.integer :battery, null: false
      t.float :display, null: false
      t.float :weight, null: false
      t.float :height, null: false
      t.float :width, null: false
      t.float :thickness, null: false
      t.integer :memory, null: false
      
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
