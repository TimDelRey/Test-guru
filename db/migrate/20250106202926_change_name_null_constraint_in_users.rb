class ChangeNameNullConstraintInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :name, true
  end
end
