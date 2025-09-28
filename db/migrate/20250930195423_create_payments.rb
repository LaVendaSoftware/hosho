class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.string :pid, null: false, index: {unique: true}, default: ""
      t.belongs_to :order, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.decimal :total, null: false, default: 0
      t.integer :gateway_type, null: false, default: 0
      t.string :gateway_payment_id
      t.datetime :paid_at

      t.timestamps
    end
  end
end
