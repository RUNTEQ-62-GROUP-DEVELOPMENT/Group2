class Book < ApplicationRecord
  has_many :goals, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :pages, presence: true
  validates :status, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["title", "author", "status"]
  end

  def self.ransortable_attributes(auth_object = nil)
    ransackable_attributes(auth_object)
  end

  # purchase:   購入予定
  # possession: 所持
  # reading:    読書中
  # finished:   読了
  enum status: { purchase: 0, possession: 1, reading: 2, finished: 3 }
end
