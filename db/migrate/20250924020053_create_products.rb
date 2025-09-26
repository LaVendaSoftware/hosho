class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :pid, null: false, index: {unique: true}, default: ""
      t.belongs_to :category, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description

      t.timestamps

      t.index [:category_id, :title], unique: true
    end
  end
end
