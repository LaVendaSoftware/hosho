class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :pid, null: false, index: {unique: true}, default: ""
      t.belongs_to :company, null: false, foreign_key: true
      t.string :title, null: false

      t.timestamps

      t.index [:company_id, :title], unique: true
    end
  end
end
