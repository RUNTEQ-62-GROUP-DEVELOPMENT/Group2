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

  def show; end

  def new
   @goal = Goal.new
  end

  def edit; end

  def create
    @goal = current_user.goals.build(goal_params)
    book = current_user.books.find_by(title: params[:goal][:book_title])
    if book.nil?
      @goal.errors.add(:book_title, "入力されたタイトルは本棚に存在しません")
      return render :new, status: :unprocessable_entity
    end

    @goal = current_user.goals.build(goal_params.merge(book_id: book.id, status: :unachieved))
    if @goal.save
      flash.now[:success] = "目標を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if (params[:goal][:reading_pages]).to_i >= @goal.book.pages
      status = :achievement
    else
      status = :unachieved
    end

    if @goal.update(goal_params.merge(status: status))
      flash.now[:success] = "進捗を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy!
    flash.now[:success] = "読書目標を削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = current_user.goals.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.require(:goal).permit(:start_date, :target_date, :reading_pages, :pages_per_day)
    end
end
