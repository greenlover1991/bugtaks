class RenameBugPostsCategoryId < ActiveRecord::Migration
  def up
    rename_column :bug_posts, :category_id, :bug_category_id
  end

  def down
  end
end
