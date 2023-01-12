# frozen_string_literal: true

# class for calc
class SessionsController < ApplicationController
  def new; end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id
      redirect_to profiles_path, notice: 'You log in'
    else
      flash[:alert] = 'Incorrect email or password'

      render :new
    end
  end

  def destroy
    # session[:current_user_id] = nil
    # self.current_user = nil
    session.delete(:user_id)

    redirect_to new_session_path, notice: 'You log out'
  end
end
