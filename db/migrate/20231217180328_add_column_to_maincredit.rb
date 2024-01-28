class AddColumnToMaincredit < ActiveRecord::Migration[7.0]
  def change
    add_column :maincredits, :getcredit, :integer
  end
end
