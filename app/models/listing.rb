class Listing < ApplicationRecord
  belongs_to :user
  mount_uploaders :photos, PhotoUploader
  
  # def user
  	# return User.find(self.user_id)
  # end
end
