class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :deadline, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  scope :top1, ->(param1) { where("title LIKE ?", "%#{param1}%") }
  scope :top2, ->(param2) { where("status LIKE ?", "%#{param2}%") }
  scope :top3, ->(param1, param2) { where("title LIKE ? AND status LIKE ?", "%#{param1}%", "%#{param2}%") } 
end