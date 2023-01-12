# frozen_string_literal: true

# class for calc
class AdminMsgsController < ApplicationController
  def new
    @msg = AdminMsg.new
  end

  def create
    # render plain: params[:post].inspect
    @msg = AdminMsg.new(msg_params)
    if @msg.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def msg_params
    params.require(:msg).permit(:body)
  end
end
