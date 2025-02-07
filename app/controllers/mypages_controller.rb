class MypagesController < ApplicationController
  def index
    @books = current_user.books.where(status:"reading").select(:title, :author, :pages)
    @goals = current_user.goals.includes(:book).where(status:"unachieved")
  end
end
