class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    @q = current_user.books.ransack(params[:q])
    @books = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
  end

  def new
    @book = current_user.books.new
  end

  def show
    @book = current_user.books.find(params[:id])
  end

  def edit
    @book = current_user.books.find(params[:id])
  end

  def create
    @book = current_user.books.new(book_params)

    if @book.save
      flash.now[:success] = t('defaults.flash_message.created', item: Book.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @book = current_user.books.find(params[:id])
    if @book.update(book_params)
      flash.now[:success] = t('defaults.flash_message.updated', item: Book.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = current_user.books.find(params[:id])
    @book.destroy
    flash.now[:success] = t('defaults.flash_message.deleted', item: Book.model_name.human)
  end

  private

  def set_book
    @book = current_user.books.find(params[:id])
  end

    def book_params
      params.require(:book).permit(:title, :author, :pages, :status)
    end
end
