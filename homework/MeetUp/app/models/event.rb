class Event < ActiveRecord::Base
  attr_accessible :date_and_time, :title, :venue_id

  # validates_presence_of :date_and_time
  validates_presence_of :title
  # validates_presence_of :venue_id

  belongs_to :venue

  # def :venue
  #   Venue.find_by_id(self.venue_id)
  # end


  def show_venue_name
  	if Venue.find_by_id(self.venue_id) != nil
  		@find_venue = Venue.find_by_id(self.venue_id)
  		@venue_name = @find_venue.name
  	else
  		@venue_name = 'Unknown'
  	end
  	return @venue_name
  end


end
