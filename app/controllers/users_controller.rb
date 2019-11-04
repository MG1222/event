class UsersController < ApplicationController

  def create
    @user = User.new(name: params[:name], email: params[:email])
	end   
end
