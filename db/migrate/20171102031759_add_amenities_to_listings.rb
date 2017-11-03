class AddAmenitiesToListings < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :amenity_list, :string, array: true, default: []
  end
end
