class AddPublishToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :publish, :boolean, default: true
  end
end
