class GoalsController < ApplicationController
  def index
  #  @goals = Goal.all
   # `Goal.ransack`でGoalに対してransackを使う
   # @goalsに対してページネートできるようにする
  #  @goals = Goal.page(params[:page])
   
   # params[:q]には検索フォームで指定した検索条件が入る
   @search = current_user.goals.includes(:book).ransack(params[:q])

   # デフォルトのソートをid降順にする
   @search.sorts = 'id desc' if @search.sorts.empty?

   # `@search.result`で検索結果となる@goalsを取得する
   # 検索結果に対してはkaminariのpageメソッドをチェーンできる
   @goals = @search.result.page(params[:page])
  end
end
