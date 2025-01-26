class MypagesController < ApplicationController
  def index
    @books = Book.where(status:"reading").select(:title, :author, :pages)
    @goals = Goal
    .joins(:book)
    .where(status:"unachieved")
    .select("books.title, start_date, target_date, pages_per_day")
  end
end
