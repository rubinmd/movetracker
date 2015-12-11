class UsersController < ApplicationController
  def index
    admin_check
    @users = User.all
  end

  def update
    admin_check
    @user=User.find(params[:id])
    @user.admin=!@user.admin
    if @user.save
      redirect_to :back, :notice => "User updated successfully."
    else
      redirect_to :back, :notice => "User not updated."
    end
  end
end
