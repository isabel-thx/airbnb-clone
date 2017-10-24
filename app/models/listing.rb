class Listing < ApplicationRecord
  belongs_to :user

  # def user
  	# return User.find(self.user_id)
  # end
end
