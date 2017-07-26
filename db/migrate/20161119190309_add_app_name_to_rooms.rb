class AddAppNameToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :app_name, :string
  end
end
