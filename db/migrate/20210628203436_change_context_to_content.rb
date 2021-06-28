class ChangeContextToContent < ActiveRecord::Migration[6.0]
  def change
    rename_column :replies, :context, :content
  end
end
