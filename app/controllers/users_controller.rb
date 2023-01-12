# frozen_string_literal: true

# class for calc
class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    users_params = params.require(:user).permit(:name, :email, :password)
    User.create(users_params)

    redirect_to new_session_path, notice: 'You succesfully Sign Up'
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
end
