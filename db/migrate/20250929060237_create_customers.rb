class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :pid, null: false, index: {unique: true}, default: ""
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :document_type, default: 0
      t.string :document, null: false
      t.string :country_code, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
