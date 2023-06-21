class ChangeUsers < ActiveRecord::Migration[7.0]
 def change
  change_column_null :users, :name, false
  change_column_null :users, :password_digest, false
  change_column_null :users, :admin, false
  change_column_null :users, :grade, false
  change_column_null :users, :semester, false
  change_column_null :maincredits, :subject, false
  change_column_null :maincredits, :credit, false
 end
end
