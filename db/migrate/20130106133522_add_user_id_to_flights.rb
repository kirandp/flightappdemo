class AddUserIdToFlights < ActiveRecord::Migration
  def change
  	add_column :flights,:user_id,:integer
  end
end
