class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # unachieved:  未達成
  # achievement: 達成
  enum status: { unachieved: 0, achievement: 1 }
end
