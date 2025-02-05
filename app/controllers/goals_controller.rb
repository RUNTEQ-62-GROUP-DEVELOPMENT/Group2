class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit update destroy]

  def index
    apply_date_filters
    @search = current_user.goals.includes(:book).ransack(params[:q] || {})
    @goals = @search.result(distinct: true).page(params[:page])
    @books = Book.all
  end

  def show
    @goal = current_user.goals.find(params[:id])
    @book = @goal.book
  end

  def new
    @goal = current_user.goals.build
  end

  def create
    @goal = current_user.goals.build(goal_params)
    Rails.logger.debug "Current user: #{current_user.inspect}"
    Rails.logger.debug "Goal params: #{goal_params.inspect}"
    Rails.logger.debug "Goal object: #{@goal.inspect}"

    if @goal.save
      flash[:notice] = "目標を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @goal = current_user.goals.find(params[:id])
    if @goal.update(goal_params)
      flash.now.notice = "目標を更新しました。"
    else
      flash.now[:danger] = "更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy
    flash.now.notice = "目標を削除しました。"
  end

  private

  def set_goal
    @goal = current_user.goals.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:book_id, :pages_per_day, :reading_pages, :target_date, :start_date, :status)
  end

  def apply_date_filters
    # params[:q] がなければ初期化
    params[:q] ||= {}
  
    # 日付フィルタの追加
    if params.dig(:q, :start_date_gteq).present?
      params[:q][:start_date_gteq] = Date.parse(params[:q][:start_date_gteq]) rescue nil
    end
  
    if params.dig(:q, :target_date_lteq).present?
      params[:q][:target_date_lteq] = Date.parse(params[:q][:target_date_lteq]) rescue nil
    end
  end
  
end
