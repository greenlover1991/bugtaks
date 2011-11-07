class AddBugCategoryIdToBugPosts < ActiveRecord::Migration
  def change
    remove_column :bug_posts, :category
    add_column :bug_posts, :category_id, :integer
  end
end
