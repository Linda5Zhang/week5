class EventsController < ApplicationController

	def index
		@events = Event.all
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @events }
		end
	end


	def show
		@event = Event.find(params[:id])

		respond_to do |format|
			format.html #show.html.erb
			format.json { render json: @event }
		end
	end


	def new
		@event = Event.new

		# @year = [2008,2009,2010,2011,2012,2013]
		# @month = ["Januray","February","March","April","May","June",
		# 	"July","August","September","October","November","December"]
		# @day = ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15",
		# 		"16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
		# @hour = [1,2,3,4,5,6,7,8,9,10,11,12,
		# 		13,14,15,16,17,18,19,20,21,22,23]
		# @minute = [00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,
		# 		16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,
		# 		32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,
		# 		50,51,52,53,54,55,56,57,58,59]

		respond_to do |format|
			format.html #new.html.erb
			format.json { render json: @event }
		end
	end


	def create
		@event = Event.new(params[:event])

		respond_to do |format|
			if @event.save
				format.html { redirect_to @event, notice: 'Event was successfully created.'}
				format.json { render json: @event, status: :created, location: @event }
			else
				format.html { render action: "new" }
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end


	def edit
		@event = Event.find(params[:id])

		respond_to do |format|
			format.html #edit.html.erb
			format.json { render json: @event }
		end
	end


	def update
		@event = Event.find(params[:id])

		respond_to do |format|
			if @event.update_attributes(params[:event])
				format.html { redirect_to @event, notice: 'Event was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end


	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		respond_to do |format|
			format.html { redirect_to events_url }
			format.json { head :no_content }
		end
	end


end

