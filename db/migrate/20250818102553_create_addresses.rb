class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :addressable, null: false, polymorphic: true, index: true
      t.string :country, null: false, limit: 2
      t.string :zip_code
      t.string :street_name
      t.string :building_number
      t.string :district
      t.string :city
      t.string :state
      t.decimal :latitude
      t.decimal :longitude
      t.string :reference, default: ""
      t.integer :source, null: false, default: 0
      t.boolean :main, null: false, default: false
      t.jsonb :raw_address, null: false, default: {}

      t.timestamps

      t.index [:latitude, :longitude]
    end
  end
end
