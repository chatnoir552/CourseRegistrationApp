class AddAddcreditToSubcredit < ActiveRecord::Migration[7.0]
  def change
    add_column :subcredits, :addcredit, :integer, default: 0
  end
end
