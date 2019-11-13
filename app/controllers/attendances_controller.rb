class AttendancesController < ApplicationController
  # before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @event = Event.find(params[:id])
    @attendance = @event.users    
  end

  def show
    @event = Event.find(params[:event_id])
    @attendance = Attendance.fin(parmas[:id])
    
  end

  def new
    @event = Event.find(params[:event_id])

  end

  def create
    @event = Event.find(params[:id])
    @amount = @event.price * 100
    
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    a = Attendance.create(stripe_customer_id: customer.id, user: current_user, event: @event)
    puts "*"*100
    puts a
    puts "*"*100
    
    if a != nil
      flash[:success] = "Vous êtes inscrits"
      redirect_to event_path(id: @event.id)
    else 
      flash[:danger] = "Un problème lors votre inscritpion est survenue"
      redirect_to new_attendance_path(id: @event.id)
    end

  

  rescue Stripe::CardError => e
    flash[:error] = e.message
    # redirect_to new_charge_path
  end

end
