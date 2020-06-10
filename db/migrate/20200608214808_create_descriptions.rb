class CreateDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :descriptions do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.string :model
      t.string :serie_number
      t.string :memory
      t.string :hard_drive
      t.string :operational_system
      t.string :warranty

      t.timestamps
    end
  end
end
