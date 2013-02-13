class VenuesController < ApplicationController
  
  def index
    @venues = Venue.all
    @venues = Venue.order("name asc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venues }
    end
  end


  def show
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @venue }
    end
  end


  def new
    @venue = Venue.new

    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: @venue }
    end
  end


  def create
    @venue = Venue.new(params[:venue])

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.'}
        format.json { render json: @venue, status: :created, location: @venue }
      else
        format.html { render action: "new" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html #edit.html.erb
      format.json { render json: @venue }
    end
  end


  def update
    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end

end
