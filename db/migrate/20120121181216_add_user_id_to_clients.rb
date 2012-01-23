class AddUserIdToClients < ActiveRecord::Migration
  def change
    add_column :client, :user_id, :integer
  end
end
