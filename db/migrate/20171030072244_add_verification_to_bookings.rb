class AddVerificationToBookings < ActiveRecord::Migration[5.1]
  def change
  	add_column :reservations, :verification, :boolean, default: false
  end
end
