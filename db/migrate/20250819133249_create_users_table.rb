class CreateUsersTable < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :pid, null: false, index: {unique: true}, default: ""
      t.integer :role, null: false, default: 0
      t.string :email_address, null: false, index: {unique: true}
      t.string :password_digest, null: false
      t.datetime :disabled_at

      t.timestamps
    end
  end
end
