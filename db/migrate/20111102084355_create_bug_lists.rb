class CreateBugLists < ActiveRecord::Migration
  def change
    create_table :bug_lists do |t|
      t.string :title, :null=>false
      t.references :project, :null=>false
      t.text :description
      t.string :status, :null=>false, :limit=>20, :default=>"Active"
      t.references :user
      t.integer :bug_posts_count, :default=>0

      t.timestamps
    end
    add_index :bug_lists, :project_id
    add_index :bug_lists, :user_id
  end
end
