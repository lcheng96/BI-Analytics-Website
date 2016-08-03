class AdminsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(username: params[:admin][:username].downcase)
    if admin && admin.authenticate(params[:admin][:password])
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end
end
