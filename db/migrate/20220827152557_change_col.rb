class ChangeCol < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :email, :username
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
