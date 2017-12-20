class RemoveAdminSuperAdminColumnInUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :admin, :boolean
    remove_column :users, :super_admin, :boolean
  end
end
