class CreateMaincredits < ActiveRecord::Migration[7.0]
  def change
    create_table :maincredits do |t|
      t.string :subject
      t.integer :credit
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
