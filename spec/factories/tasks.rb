FactoryBot.define do
  factory :task do
    task_name { '名前1' }
    task_content { 'コンテント1' }
    deadline { '2023-02-02' }
    priority { '高' }
    status { '着手中' }
  end

  factory :second_task, class:Task do
    task_name{ '名前2' }
    task_content{ 'コンテント2' }
    deadline { '2023-03-03' }
    priority { '低' }
    status { '完了' }
  end
end
