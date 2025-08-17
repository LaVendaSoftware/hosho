class CreateCompaniesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.string :pid, null: false, index: {unique: true}, default: ""
      t.string :name, null: false, index: {unique: true}
      t.string :nif
      t.integer :industry, default: 0
      t.datetime :disabled_at

      t.timestamps
    end
  end
end
