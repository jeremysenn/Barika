class ChangeClientUserDefault < ActiveRecord::Migration
  def up
    change_column_default :client, :user_id, 1
  end

  def down
    change_column_default :client, :user_id, nil
  end
end
