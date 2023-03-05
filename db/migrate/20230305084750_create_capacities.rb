class CreateCapacities < ActiveRecord::Migration[6.1]
  def change
    create_table :capacities do |t|

      t.timestamps
    end
  end
end
