class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, :null=>false
      t.string :password, :null=>false
      t.references :role
      t.string :screen_name, :null=>false
      t.string :email
      t.integer :bug_posts_count, :default=>0
      t.boolean :is_notify, :default=>true

      t.timestamps
    end
    add_index :users, :role_id
  end
end
