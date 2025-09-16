class CreateAddresses < ActiveRecord::Migration[8.1]
  def change
    create_table :addresses do |t|
      t.belongs_to :addressable, null: false, polymorphic: true, index: true
      t.string :country, default: "PT"
      t.string :zip_code
      t.string :street_name
      t.string :building_number
      t.string :district
      t.string :city
      t.string :state
      t.string :complement
      t.decimal :latitude
      t.decimal :longitude
      t.string :reference

      t.timestamps
    end
  end
end
