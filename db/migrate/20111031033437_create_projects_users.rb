class CreateProjectsUsers < ActiveRecord::Migration
  def up
    create_table :projects_users, :id=>false do |t|
      t.integer :project_id, :null=>false
      t.integer :user_id, :null=>false
    end
  end

  def down
    drop_table :projects_users
  end
end
