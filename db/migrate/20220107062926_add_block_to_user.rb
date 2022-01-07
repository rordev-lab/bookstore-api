class AddBlockToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :block, :boolean, default: false
  end
end
