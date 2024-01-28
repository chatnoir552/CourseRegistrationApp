class AddAddcreditToMaincredit < ActiveRecord::Migration[7.0]
  def change
    add_column :maincredits, :addcredit, :integer, default: 0
  end
end
