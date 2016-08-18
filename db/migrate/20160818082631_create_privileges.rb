class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
      t.string :name
      t.string :remark

      t.timestamps null: false
    end
  end
end
