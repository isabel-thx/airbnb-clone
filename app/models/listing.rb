class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploaders :photos, PhotoUploader
  
  validates :title, presence: true
  validates :street_address, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :description, presence: true
  validates :house_rules, presence: true
  validates :property_type, presence: true
  validates :check_in_time, presence: true
  validates :check_out_time, presence: true

  validates :num_of_rooms, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :num_of_bathrooms, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :price, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :max_num_of_guests, presence: true, numericality: { greater_than: 0, only_integer: true }



	def self.search(location:, guest:, start_date:, end_date:)
		Listing.where("(SELECT COUNT(*) FROM reservations WHERE (reservations.listing_id = listings.id) AND (reservations.start_date, reservations.end_date) OVERLAPS (DATE ?, DATE ?)) = 0", start_date, end_date).where("(state LIKE ? OR city LIKE ? OR country LIKE ?)", "%#{location}%", "%#{location}%", "%#{location}%").where("(max_num_of_guests >= ?)", guest)
	end
	
end
