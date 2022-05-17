class Task < ApplicationRecord
  enum priority:{低: 0, 中: 1, 高: 2}
  validates :title, presence: true
  validates :content, presence: true
  validates :deadline, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  scope :top1, ->(param1){ where("title LIKE ?", "%#{param1}%") }
  scope :top2, ->(param2){ where("status LIKE ?", "%#{param2}%") }
  scope :top3, ->(param1, param2) { where("title LIKE ? AND status LIKE ?", "%#{param1}%", "%#{param2}%") }
  belongs_to :user
  has_many :connects, dependent: :destroy
  has_many :labels, through: :connects, source: :label
end