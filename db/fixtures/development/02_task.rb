10.times do |i|
  Task.create!(task_name: "タスク", task_content: "テスト", deadline: "2023-01-25", user_id: 1)
end