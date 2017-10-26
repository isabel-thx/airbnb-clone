class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
    	t.references :user, foreign_key: true
    	t.references :listing, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :num_of_guests, null: false

      t.timestamps

    end
  end
end
