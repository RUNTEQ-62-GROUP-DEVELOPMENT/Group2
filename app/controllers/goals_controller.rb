class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit update destroy]

  def index
    @search = Goal.includes(:book).ransack(params[:q] || {})
    apply_date_filters
    @goals = @search.result(distinct: true).page(params[:page])
    @books = Book.all
  end

  def show
    @goal = Goal.find(params[:id])
    @book = @goal.book
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goals_path, notice: '目標が登録されました。'
    else
      flash.now[:alert] = '登録に失敗しました。'
      render :new
    end
  end

  def edit; end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goals_path, success: '目標を更新しました。'
    else
      flash.now[:danger] = "更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_url, success: '目標を削除しました。'
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:book_id, :pages_per_day, :reading_pages, :target_date, :start_date)
  end

  def apply_date_filters
    @search = Goal.ransack(params[:q])

    if params.dig(:q, :start_date_gteq).present? && params.dig(:q, :target_date_lteq).blank?
      @search = @search.ransack(start_date_gteq: params.dig(:q, :start_date_gteq))
    end

    if params.dig(:q, :start_date_gteq).blank? && params.dig(:q, :target_date_lteq).present?
      @search = @search.ransack(target_date_lteq: params.dig(:q, :target_date_lteq))
    end

    return unless params.dig(:q, :start_date_gteq).present? && params.dig(:q, :target_date_lteq).present?

    @search = @search.ransack(start_date_gteq: params.dig(:q, :start_date_gteq),
                              target_date_lteq: params.dig(:q, :target_date_lteq))
  end
end
