class CreateParts < ActiveRecord::Migration[6.1]
  def change
    create_table :parts do |t|
      t.string :part_number
      t.string :description
      t.string :manufacturer
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
