class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :start_date, presence: true
  validates :target_date, presence: true
  validate :target_date_after_start_date

  private

  def target_date_after_start_date
    if target_date.present? && start_date.present? && target_date < start_date
      errors.add(:target_date, "読書目標日は読書開始日より後の日付である必要があります。")
    end
  end

  # unachieved:  未達成
  # achievement: 達成
  enum status: { unachieved: 0, achievement: 1 }

  attr_accessor :book_title

  def self.ransackable_associations(auth_object = nil)
    ["book", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["book_id", "created_at", "id", "pages_per_day", "reading_pages", "start_date", "status", "target_date", "updated_at", "user_id"] # 自分のアプリに合った属性名に変更
  end
end
