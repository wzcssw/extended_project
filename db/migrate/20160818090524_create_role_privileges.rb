class CreateRolePrivileges < ActiveRecord::Migration
  def change
    create_table :role_privileges do |t|
      t.references :privilege, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
