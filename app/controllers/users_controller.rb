class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_book = @user.books
    #部分テンプレートへ
    @bubun_user = User.find(current_user.id)
  end

  def index
    @user = User.all
    #部分テンプレートへ
    @bubun_user = User.find(current_user.id)
    @book = Book.new
  end

  private
  def user_params
    params.require(:list).permit(:title, :body, :profile_image)
  end

end
