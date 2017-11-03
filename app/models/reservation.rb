class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :num_of_guests, presence: true, numericality: { greater_than: 0, only_integer: true }
  

  validate :check_overlapping_dates, on: :create
  # without S for custom validation


  def check_overlapping_dates
    listing.reservations.each do |prev_booking|
      if overlap?(self, prev_booking)
        self.errors.add(:overlapping_dates, "The booking dates conflict with an existing booking")
      end
    end
  end

  def overlap?(x,y)
    (x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
  end

  def total_amount
    price = listing.price
    num_dates = ((start_date..end_date).to_a.length) - 1
    return price * num_dates
  end

end