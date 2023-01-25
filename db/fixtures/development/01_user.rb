10.times do |i|
  Label.create!(name: "java#{i + 1}",)
end

10.times do |i|
  Task.create!(task_name: "タスク", task_content: "テスト", deadline: "2023-01-25", user_id: 1)
end

User.create(name: 'seed1', email: 'seed1@gmail.com', password: 'seed1@gmail.com', password_confirmation: 'seed1@gmail.com')
User.create(name: 'seed2', email: 'seed2@gmail.com', password: 'seed1@gmail.com', password_confirmation: 'seed1@gmail.com')
User.create(name: 'seed3', email: 'seed3@gmail.com', password: 'seed1@gmail.com', password_confirmation: 'seed1@gmail.com')
User.create(name: 'seed4', email: 'seed4@gmail.com', password: 'seed1@gmail.com', password_confirmation: 'seed1@gmail.com')
User.create(name: 'seed5', email: 'seed5@gmail.com', password: 'seed1@gmail.com', password_confirmation: 'seed1@gmail.com')
User.create(name: 'seed6', email: 'seed6@gmail.com', password: 'seed1@gmail.com', password_confirmation: 'seed1@gmail.com')
User.create(name: 'seed7', email: 'seed7@gmail.com', password: 'seed1@gmail.com', password_confirmation: 'seed1@gmail.com')
User.create(name: 'seed8', email: 'seed8@gmail.com', password: 'seed1@gmail.com', password_confirmation: 'seed1@gmail.com')
User.create(name: 'seed9', email: 'seed9@gmail.com', password: 'seed1@gmail.com', password_confirmation: 'seed1@gmail.com')
User.create(name: 'seed10', email: 'seed10@gmail.com', password: 'seed1@gmail.com', password_confirmation: 'seed1@gmail.com')