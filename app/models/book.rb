class Book < ApplicationRecord
  has_many :goals, dependent: :destroy
  belongs_to :user

  # purchase:   購入予定
  # possession: 所持
  # reading:    読書中
  # finished:   読了
  enum status: { purchase: 0, possession: 1, reading: 2, finished: 3 }
end
