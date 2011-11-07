class CreateUserNotifications < ActiveRecord::Migration
  def change
    create_table :user_notifications do |t|
      t.string :title, :null=>false
      t.text :body, :null=>false
      t.string :notification_url
      t.integer :sent_to_id, :null=>false
      t.integer :sent_for_id, :null=>false

      t.timestamps
    end
  end
end
