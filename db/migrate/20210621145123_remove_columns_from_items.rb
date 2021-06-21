class RemoveColumnsFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :quantity, :string
    remove_column :items, :gender, :string
  end
end
