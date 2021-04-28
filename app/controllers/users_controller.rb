class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :cheak_correct_user, {only: [:edit, :update ]}

  def show
    @user = User.find(params[:id])
    @user_book = @user.books
    #部分テンプレートへ
    @bubun_user = current_user
    @book = Book.new
  end

  def index
    @user = User.all
    #部分テンプレートへ
    @bubun_user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      @bubun_user = current_user
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def cheak_correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end