class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.string :day_of_week, null: false
      t.integer :period, null: false
      t.integer :credit, null: false
      t.string :name, null: false
      t.integer :school_year
      t.references :user, null: false, foreign_key: true
      t.references :maincredit, foreign_key: true
      t.references :subcredit, foreign_key: true
      t.boolean :necessary, null: false
      t.boolean :take
      t.integer :exam_per
      t.integer :report_per
      t.integer :minitest_per
      t.integer :normal_per

      t.timestamps
    end
  end
end
