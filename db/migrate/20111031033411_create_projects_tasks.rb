class CreateProjectsTasks < ActiveRecord::Migration
  def up
    create_table :projects_tasks, :id=>false do |t|
      t.integer :project_id, :null=>false
      t.integer :task_id, :null=>false
    end
  end

  def down
    drop_table :projects_tasks
  end
end
