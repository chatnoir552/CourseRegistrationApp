class CreateSubcredits < ActiveRecord::Migration[7.0]
  def change
    create_table :subcredits do |t|
      t.string :subject, null: false
      t.string :credit, null: false
      t.references :maincredit, null: false, foreign_key: true

      t.timestamps
    end
    add_index :subcredits, :credit
  end
end
