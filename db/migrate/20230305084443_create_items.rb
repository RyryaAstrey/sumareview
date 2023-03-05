class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      t.integer :operation_system_id, null: false
      t.integer :spec_id, null: false
      t.integer :maker_id, null: false
      t.integer :capacity_id, null: false
      t.integer :certification_id, null: false
      t.integer :central_processing_unit_id, null: false
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price, null: false
      t.integer :battery, null: false
      t.float :display, null: false
      t.float :height, null: false
      t.float :width, null: false
      t.float :thickness, null: false
      t.string :core, null: false
      t.integer :memory, null: false
      t.string :mein_camera, null: false
      t.string :in_camera, null: false
      t.string :release_date, null: false
      
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
