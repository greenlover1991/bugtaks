class CreateBugComments < ActiveRecord::Migration
  def change
    create_table :bug_comments do |t|
      t.references :bug_post, :null=>false
      t.text :body, :null=>false
      t.references :user, :null=>false
      t.string :img_url

      t.timestamps
    end
    add_index :bug_comments, :bug_post_id
    add_index :bug_comments, :user_id
  end
end
