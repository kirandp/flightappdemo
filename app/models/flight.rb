class Flight < ActiveRecord::Base
  attr_accessible :desc, :dest, :in, :number, :off, :on, :out, :source,:user_id
  belongs_to :user
  validates :number,:source,:dest,:user_id,:presence=>true
end
