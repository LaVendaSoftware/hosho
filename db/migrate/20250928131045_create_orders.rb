class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :pid, null: false, index: {unique: true}, default: ""
      t.belongs_to :company, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.string :currency, null: false, default: "BRL"
      t.date :due_date
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
