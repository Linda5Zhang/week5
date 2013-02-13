class Venue < ActiveRecord::Base
  attr_accessible :address, :name

  validates_presence_of :address
  validates_presence_of :name

  has_many :events


end
