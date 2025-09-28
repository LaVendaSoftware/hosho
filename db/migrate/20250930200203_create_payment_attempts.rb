class CreatePaymentAttempts < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_attempts do |t|
      t.belongs_to :payment, null: false, foreign_key: true
      t.string :payment_intent_id
      t.jsonb :payload
      t.datetime :requested_at

      t.timestamps
    end
  end
end
