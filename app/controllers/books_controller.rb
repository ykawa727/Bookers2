class BooksController < ApplicationController
  def new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(current_user)
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
