class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.string :property_type, null: false
      t.integer :num_of_rooms, null: false
      t.integer :num_of_bathrooms, null: false
      t.integer :price, null: false
      t.text :house_rules, null: false

      t.timestamps
    end
  end
end