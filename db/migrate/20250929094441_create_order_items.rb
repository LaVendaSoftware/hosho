class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.string :pid, null: false, index: {unique: true}, default: ""
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :product_variant, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.decimal :unit_price, null: false, default: 0
      t.decimal :discount, null: false, default: 0
      t.virtual :subtotal, type: :decimal, as: "quantity * unit_price", stored: true
      t.virtual :total, type: :decimal, as: "(quantity * unit_price) - discount", stored: true

      t.timestamps
    end
  end
end
