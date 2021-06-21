class AddStyleToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :style, null: false, foreign_key: true
  end
end
