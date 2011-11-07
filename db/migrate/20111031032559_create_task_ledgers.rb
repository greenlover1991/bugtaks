class CreateTaskLedgers < ActiveRecord::Migration
  def change
    create_table :task_ledgers do |t|
      t.references :project, :null=>false
      t.references :task, :null=>false
      t.datetime :start_datetime, :null=>false
      t.datetime :end_datetime
      t.references :user, :null=>false
      t.float :duration
      t.text :description
      t.string :status, :null=>false, :limit=>20, :default=>"Active"
      t.boolean :is_manual, :default=>false

      t.timestamps
    end
    add_index :task_ledgers, :project_id
    add_index :task_ledgers, :task_id
    add_index :task_ledgers, :user_id
  end
end
