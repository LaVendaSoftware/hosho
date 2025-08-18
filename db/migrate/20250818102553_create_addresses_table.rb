class CreateAddressesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :addressable, null: false, polymorphic: true, index: true
      t.string :country, default: "PT"
      t.string :zip_code
      t.string :street_name
      t.string :building_number
      t.boolean :absent_number, default: false, null: false
      t.string :district
      t.string :city
      t.integer :state
      t.string :complement
      t.decimal :latitude
      t.decimal :longitude
      t.text :reference

      t.timestamps
    end
  end
end
