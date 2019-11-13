class UsersController < ApplicationController

  
 before_action :authenticate_user! #, except: [:index]
 before_action :current_user #, except: [:index]
 


  def show
    @user = current_user
  # @event = Event.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
  		redirect_to user_path(@user.id)
  	else 
 		logger.debug "User created:@user.inspect"
      puts "#{@user}"
      puts "#{@user.errors.inspect}"
      render :new
  end
    
  end
 
end # class
# description