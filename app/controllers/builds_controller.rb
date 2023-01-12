# frozen_string_literal: true

# class for calc
class BuildsController < ApplicationController
  def index
    @builds = Post.all
  end

  def edit; end

  # def new
  #   @build = Build.new
  # end

  def create
    # render plain: params[:post].inspect
    @post = Post.find(params[:post_id])
    @build = @post.builds.create(build_params)

    redirect_to post_path(@post)
  end

  private

  # def show
  #   @build = Build.find(params[:id])
  # end
  def build_params
    params.require(:build).permit(:name, :body, images: [])
  end
end
