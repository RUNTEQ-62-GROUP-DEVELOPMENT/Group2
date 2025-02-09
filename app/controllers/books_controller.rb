class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @search = current_user.books.ransack(params[:q])
    @books = @search.result.page(params[:page])
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = current_user.books.new(book_params)
    if @book.save
      flash.now.notice = "本を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    if @book.update(book_params)
      flash.now.notice = "ねこを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    flash.now.notice = "本を削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = current_user.books.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :pages, :status, :user)
    end
end
