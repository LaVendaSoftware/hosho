class CreateConnectedAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :connected_accounts do |t|
      t.string :pid, null: false, index: {unique: true}, default: ""
      t.string :type
      t.belongs_to :user, null: false, foreign_key: true
      t.string :external_id, null: false
      t.jsonb :metadata, default: {}

      t.timestamps

      t.index [:type, :user_id, :external_id], unique: true
    end
  end
end
