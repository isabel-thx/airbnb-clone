class AddColumnsToListings < ActiveRecord::Migration[5.1]
  
  def change
  	add_column :listings, :street_address, :string, null: false
  	add_column :listings, :zipcode, :integer, null: false
  	add_column :listings, :city, :string, null: false
  	add_column :listings, :state, :string, null: false
  	add_column :listings, :country, :string, null: false
  	add_column :listings, :max_num_of_guests, :integer, null: false
  end

end
