class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, :null=>false
      t.text :description
      t.references :project

      t.timestamps
    end
    add_index :tasks, :project_id
  end
end
