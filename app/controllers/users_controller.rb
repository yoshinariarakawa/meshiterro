class UsersController < ApplicationController

  def update
    is_matching_login_user
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
  end
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
   is_matching_login_user
  @user = User.find(params[:id])
  end



   private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end


