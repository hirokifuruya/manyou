class Task < ApplicationRecord
  validates :task_name, presence: true
  validates :task_content, presence: true
end
