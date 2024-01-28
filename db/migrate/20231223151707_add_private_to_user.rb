class AddPrivateToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :private, :boolean
  end
end
