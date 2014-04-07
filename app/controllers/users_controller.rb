class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to requirements_path, notice: 'Your profile has been successfully updated!'
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @requirements = Requirement.all
  end
end
