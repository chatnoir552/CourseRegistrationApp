class AddAnyToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :admin, :boolean
    add_column :users, :grade, :string
    add_column :users, :semester, :string
  end
end
