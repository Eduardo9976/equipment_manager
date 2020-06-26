class AddHardDriveAndSystemOperationalToDescription < ActiveRecord::Migration[6.0]
  def change
    add_column :descriptions, :hard_drive, :integer
    add_column :descriptions, :operational_system, :integer
  end
end
