class Task < ApplicationRecord
  belongs_to :user

  validates :task_name, presence: true
  validates :task_content, presence: true
  validates :deadline, presence: true

  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings

  enum status:{"未着手": 0, "着手中": 1, "完了": 2 }
  enum priority:{"低":0, "中":1, "高":2 }

  scope :get_by_task_name, ->(task_name) {
    where("task_name like ?","%#{task_name}%")
  }
  scope :get_by_status, ->(status){
    where(status: status)
  }

  scope :desc_sort, ->{reorder(priority: :desc)}
end
