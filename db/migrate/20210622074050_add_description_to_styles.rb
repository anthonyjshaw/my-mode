class AddDescriptionToStyles < ActiveRecord::Migration[6.0]
  def change
    add_column :styles, :description, :text
  end
end
