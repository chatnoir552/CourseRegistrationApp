class AddColumnToSubcredit < ActiveRecord::Migration[7.0]
  def change
    add_column :subcredits, :getcredit, :integer
  end
end
