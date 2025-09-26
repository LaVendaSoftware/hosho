class CreateProductVariants < ActiveRecord::Migration[8.0]
  def change
    create_table :product_variants do |t|
      t.string :pid, null: false, index: {unique: true}, default: ""
      t.belongs_to :product, null: false, foreign_key: true
      t.string :title, null: false
      t.decimal :price, null: false
      t.text :description

      t.timestamps
    end
  end
end
