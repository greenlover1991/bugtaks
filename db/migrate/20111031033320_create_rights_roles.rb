class CreateRightsRoles < ActiveRecord::Migration
  def up
    create_table :rights_roles, :id=>false do |t|
      t.integer :right_id, :null=> false
      t.integer :role_id, :null=> false

    end
  end

  def down
    drop_table :rights_roles
  end
end
