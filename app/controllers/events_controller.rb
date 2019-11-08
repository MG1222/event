class EventsController < ApplicationController
   # before_action :set_event, only: [:show, :edit, :update, :destroy]

    before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @creator = @event.user
  end

  def new
    

  end

  def create
    @event = Event.new(title: params[:title], location: params[:location], start_date: params[:start_date], duration: params[:duration].to_i, description: params[:description], price: params[:price].to_i, user: current_user)
     if @event.save
    redirect_to event_path(@event.id)
  else
      logger.debug "Event created:@event.inspect"
      puts "#{@event}"
      puts "#{@event.errors.inspect}"
      render :new
    end
  end
  def destroy
    @event = Event.find(params[:id])

    @event.destroy
    flash[:success] = "Event Deleted"
    redirect_to current_user
    
  end

end
