class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :follow_id, null: false
      t.timestamps
    end
  end
end
