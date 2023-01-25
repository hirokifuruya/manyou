# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# <userデータ>
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


# <labelデータ>
10.times do |i|
  Label.create!(name: "LABEL#{i + 1}")
end

# <taskデータ>
10.times do |i|
  Task.create!(
    task_name: "タイトル#{i + 1}",
    task_content: "テスト",
    deadline: '2023-01-25',
    priority: rand(0..2),
    status: rand(0..2),
    user_id: rand(0..10)
  )
end