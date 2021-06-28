class AddStyleToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :style, null: false, foreign_key: true
  end
end
