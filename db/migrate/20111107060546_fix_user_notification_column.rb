class FixUserNotificationColumn < ActiveRecord::Migration
  def up
		rename_column :user_notifications, :sent_for_id, :sent_by_id
  end

  def down
  end
end
