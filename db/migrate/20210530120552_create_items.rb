class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :clothes_type
      t.string :color
      t.text :description
      t.string :size
      t.decimal :price
      t.integer :quantity
      t.string :name
      t.boolean :is_in_stock

      t.timestamps
    end
  end
end
