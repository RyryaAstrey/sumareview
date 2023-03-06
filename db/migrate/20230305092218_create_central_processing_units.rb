class CreateCentralProcessingUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :central_processing_units do |t|
      
      t.string :name, null: false

      t.timestamps
    end
  end
end
