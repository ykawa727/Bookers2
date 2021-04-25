class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  private
  def user_params
    params.require(:list).permit(:title, :body, :profile_image)
  end

end
