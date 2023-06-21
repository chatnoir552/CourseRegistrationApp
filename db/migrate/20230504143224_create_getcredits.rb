class CreateGetcredits < ActiveRecord::Migration[7.0]
  def change
    create_table :getcredits do |t|
      t.integer :credit, null: false
      t.references :user, null: false, foreign_key: true
      t.references :maincredit, null: false, foreign_key: true
      t.references :subcredit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
