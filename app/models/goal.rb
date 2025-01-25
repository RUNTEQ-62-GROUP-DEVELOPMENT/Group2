class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.ransackable_attributes(_auth_object = nil)
    %w[book_id created_at id pages_per_day reading_pages start_date status target_date
       updated_at user_id book_title_cont]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[book user]
  end
  # unachieved:  未達成
  # achievement: 達成
  enum status: { unachieved: 0, achievement: 1 }
end
