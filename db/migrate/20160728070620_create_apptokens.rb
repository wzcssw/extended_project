class CreateApptokens < ActiveRecord::Migration
  def change
    create_table :apptokens do |t|
      t.string :token
      t.string :description

      t.timestamps null: false
    end
  end
end
