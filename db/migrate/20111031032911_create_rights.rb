class CreateRights < ActiveRecord::Migration
  def change
    create_table :rights do |t|
      t.string :name, :null=>false
      t.text :description
      t.boolean :is_read, :default=>false
      t.boolean :is_delete, :default=>false
      t.boolean :is_update, :default=>false
      t.boolean :is_create, :default=>false
      t.boolean :is_executable, :default=>false

      t.timestamps
    end
  end
end
