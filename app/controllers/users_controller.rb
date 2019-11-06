class UsersController < ApplicationController

  
 before_action :authenticate_user! #, except: [:index]
 before_action :current_user #, except: [:index]


    def show
    @user = current_user
  end

  def edit
  end

  def update
    
  end
 
end # class
