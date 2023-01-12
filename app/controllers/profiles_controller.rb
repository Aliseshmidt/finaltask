# frozen_string_literal: true

# class for calc
class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.name = current_user.name
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile
    else
      render 'new'
    end
  end

  def edit
    if Profile.find_by_user_id(current_user.id)
      @profile = Profile.find_by_user_id(current_user.id)
    else
      create
    end
  end

  def update
    @profile = Profile.find_by_user_id(current_user.id)

    if @profile.update(profile_params)
      redirect_to @profile
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :info, :rang, :post_id)
  end
end
