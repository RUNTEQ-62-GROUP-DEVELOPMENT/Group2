class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit update destroy]

  def index
    @search = Goal.includes(:book).ransack(params[:q] || {})
    apply_date_filters
    @goals = @search.result(distinct: true).page(params[:page])
    @books = Book.all
  end

  def show; end

  def new
    @goal = Goal.new
  end

  def edit; end

  def update
    if @goal.update(goal_params)
      redirect_to @goal, notice: '目標を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_url, notice: '目標を削除しました。'
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
