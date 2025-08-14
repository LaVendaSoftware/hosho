class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :nif
      t.integer :industry
      t.datetime :disabled_at

      t.timestamps
    end
  end
end
