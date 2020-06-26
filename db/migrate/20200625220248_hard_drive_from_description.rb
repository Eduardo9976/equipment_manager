class HardDriveFromDescription < ActiveRecord::Migration[6.0]
  def change
    remove_column :descriptions, :hard_drive, :string
    remove_column :descriptions, :operational_system, :string
  end
end
