class AddColumnsToStyles < ActiveRecord::Migration[6.0]
  def change
    add_column :styles, :name, :string
    add_reference :styles, :user, null: false, foreign_key: true
  end
end
