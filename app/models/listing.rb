class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploaders :photos, PhotoUploader
  
  validates :num_of_rooms, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :num_of_bathrooms, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :price, presence: true, numericality: { greater_than: 0, only_integer: true }

end
