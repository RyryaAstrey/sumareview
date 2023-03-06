class CreateOperationSystems < ActiveRecord::Migration[6.1]
  def change
    create_table :operation_systems do |t|
      
      t.string :name, null: false

      t.timestamps
    end
  end
end
