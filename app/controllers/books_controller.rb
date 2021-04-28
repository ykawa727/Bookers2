class BooksController < ApplicationController
   before_action :authenticate_user!
   before_action :correct_book, only: [:edit, :update, :destroy]

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save(book_params)
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @bubun_user = current_user
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    #部分テンプレートへ
    @bubun_user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_user = @book.user
    #部分テンプレートへ
    @bubun_user = current_user
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @bubun_user = current_user
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_book
    @book =Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end
end
