class AddGenderToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :gender, :integer
  end
end
