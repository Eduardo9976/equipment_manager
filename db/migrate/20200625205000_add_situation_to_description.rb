class AddSituationToDescription < ActiveRecord::Migration[6.0]
  def change
    add_column :descriptions, :situation, :integer, default: 0
  end
end
