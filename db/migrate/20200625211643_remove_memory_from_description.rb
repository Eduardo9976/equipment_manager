class RemoveMemoryFromDescription < ActiveRecord::Migration[6.0]
  def change
    remove_column :descriptions, :memory, :string
  end
end
