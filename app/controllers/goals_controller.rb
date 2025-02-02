class GoalsController < ApplicationController
  before_action :set_goal, only: %i[ show edit update destroy ]
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

  def new
    @goal = Goal.new
  end

  def edit
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      flash.now.notice = "目標を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @goal.update(goal_params)
      flash.now.notice = "進捗を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy
    flash.now.notice = "読書目標を削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = current_user.goals.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.require(:goal).permit(:book_title, :start_date, :target_date, :pages_per_day)
    end
end
