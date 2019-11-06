class UsersController < ApplicationController
include UsersHelper
  
 before_action :authenticate_user! #, except: [:index]
 before_action :current_user #, except: [:index]


    def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    
  end
 
end # class
