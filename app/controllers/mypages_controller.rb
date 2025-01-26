class MypagesController < ApplicationController
  def index
    @books = Book.where(status:"reading").select(:title, :author, :pages)
    @goals = Goal
    .joins(:book)
    .where(status:"unachieved")
    #current_pageを入れる
    #.select("books.title, start_date, target_date, pages_per_day, current_page")
    .select("books.title, start_date, target_date, pages_per_day")
  end
end
