class AttendancesController < ApplicationController
  # before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances

  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1

  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
 
  def create
   
  end

  # PATCH/PUT /attendances/1

  def update
 
  end

  # DELETE /attendances/1

  def destroy
 
  end


end
