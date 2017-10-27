class AddCheckInCheckOutToListings < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :check_in_time, :string, null: false
  	add_column :listings, :check_out_time, :string, null: false

  end
end
