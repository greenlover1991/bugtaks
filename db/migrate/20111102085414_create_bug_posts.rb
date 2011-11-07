class CreateBugPosts < ActiveRecord::Migration
  def change
    create_table :bug_posts do |t|
      t.string :title, :null=>false
      t.text :body, :null=>false
      t.string :status, :null=>false, :default=>"For Fixing"
      t.string :img_url
      t.references :bug_list, :null=>false
      t.integer :posted_by_id, :null=>false
      t.integer :posted_for_id, :null=>false
      t.string :priority, :null=>false, :limit=>20, :default=>"Normal"
      t.string :category
      t.integer :no_of_fixes, :null=>false, :default=>0
      t.integer :no_of_tests, :null=>false, :default=>1
      t.datetime :closed_datetime

      t.timestamps
    end
    add_index :bug_posts, :bug_list_id
    add_index :bug_posts, :posted_by_id
    add_index :bug_posts, :posted_for_id
  end
end
