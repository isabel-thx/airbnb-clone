class AddRoleToUsers < ActiveRecord::Migration[5.1]
  
  def change
  	add_column :users, :role, :integer, default: 0

  	# add_column :users, :superadmin, :boolean
  	# add_column :users, :moderator, :boolean
  	# add_column :users, :customer, :boolean
  end

end
