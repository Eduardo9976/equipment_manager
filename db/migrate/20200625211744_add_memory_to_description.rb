class AddMemoryToDescription < ActiveRecord::Migration[6.0]
  def change
    add_column :descriptions, :memory, :integer
  end
end
