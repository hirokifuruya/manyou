class Task < ApplicationRecord
  validates :task_name, presence: true
  validates :task_content, presence: true
  validates :deadline, presence: true

  enum status: {"未着手": 0, "着手中": 1, "完了": 2 }

end
