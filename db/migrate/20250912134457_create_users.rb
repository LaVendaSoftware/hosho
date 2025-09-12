class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :pid, null: false, index: {unique: true}, default: ""
      t.string :name, null: false
      t.integer :role, null: false, default: 0

      ## Database authenticatable
      t.string :email, null: false, index: {unique: true}, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string :reset_password_token, index: {unique: true}
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      t.datetime :disabled_at

      t.timestamps null: false
    end
  end
end
