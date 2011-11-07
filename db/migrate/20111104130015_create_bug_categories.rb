class CreateBugCategories < ActiveRecord::Migration
  def change
    create_table :bug_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
