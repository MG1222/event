module UsersHelper
	  def current_user
	    @user = User.find(params[:id])
	    unless @user.id == current_user.id
	      redirect_to root_path
    end
  end
end
