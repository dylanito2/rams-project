class AddIsModeratorAndIsAdminToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :is_moderator, :boolean, default: 0
    add_column :accounts, :is_admin, :boolean, default: 0
  end
end
