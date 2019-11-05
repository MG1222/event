class EventsController < ApplicationController
   # before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

  end

  # GET /events/1
  def show  
    @event = Event.find(params[:id])
    @creator = @event.user
  end

  # GET /events/new
  def new
    @event = Event.new

  end

  # GET /events/1/edit
  def edit
  end

  # POST /events

  def create
  
  end

  # PATCH/PUT /events/1

  def update

  end

  # DELETE /events/1

  def destroy
 
  end


end
