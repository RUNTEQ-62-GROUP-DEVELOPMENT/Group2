class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :author, presence: true, length: { maximum: 255 }
  validates :pages, presence: true, numericality: { only_integer: true, greater_than: 0 }

  has_many :goals, dependent: :destroy
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["author", "created_at", "id", "pages", "status", "title", "updated_at", "user_id"]
  end

  # purchase:   購入予定
  # possession: 所持
  # reading:    読書中
  # finished:   読了
  enum status: { purchase: 0, possession: 1, reading: 2, finished: 3 }

  def self.ransackable_attributes(auth_object = nil)
    ["author", "created_at", "id", "pages", "status", "title", "updated_at", "user_id"]
  end

end
