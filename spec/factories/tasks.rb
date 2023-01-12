FactoryBot.define do
  factory :task do
    task_name { '名前1' }
    task_content { 'コンテント1' }
  end

  factory :second_task, class:Task do
    task_name{ '名前2' }
    task_content{ 'コンテント2' }
  end
end
