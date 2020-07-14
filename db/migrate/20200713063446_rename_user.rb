class RenameUser < ActiveRecord::Migration[6.0]
  def change
  	rename_table :users, :old_users
  end
end
