class UsersController < ApplicationController

  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      puts "ok "
    else 
      logger.debug "User created:@user.inspect"
      puts "#{@user}"
      puts "#{@user.errors.inspect}"
  end
      
end
