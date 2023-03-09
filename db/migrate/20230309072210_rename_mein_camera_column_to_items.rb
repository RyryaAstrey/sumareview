class RenameMeinCameraColumnToItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :mein_camera, :main_camera
  end
end
