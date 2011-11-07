class FixTaskColumn < ActiveRecord::Migration
  def up
    remove_column :tasks, :project_id
    add_column :tasks, :task_id, :integer
  end

  def down
  
  end
end
