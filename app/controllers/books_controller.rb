class BooksController < ApplicationController
  def new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def index
    @book = Book.new
    @books = Book.all
    #部分テンプレートへ
    @bubun_user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @book_user = @book.user
    #部分テンプレートへ
    @bubun_user = User.find(current_user.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
