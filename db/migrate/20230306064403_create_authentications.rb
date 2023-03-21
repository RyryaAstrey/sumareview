class CreateAuthentications < ActiveRecord::Migration[6.1]
  def change
    create_table :authentications do |t|
      
      t.string :name

      t.timestamps
    end
  end
end
