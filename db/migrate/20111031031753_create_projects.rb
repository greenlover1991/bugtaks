class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, :null=>false
      t.date :start_date, :null=>false
      t.date :end_date
      t.text :description
      t.string :status, :null=>false, :limit=>20, :default=>"Active"

      t.timestamps
    end
  end
end
