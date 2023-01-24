FactoryBot.define do

  factory :user, class: User do
    id { 1 }
    name { "管理者" }
    email { "admin@dive.com" }
    password { "123456" }
    password_confirmation { "123456" }
    admin { "true" }
  end

  factory :user1, class: User do
    id { 2 }
    name { "user1" }
    email { "user1@dive.com" }
    password { "222222" }
    password_confirmation { "222222" }
    admin { "false" }
  end

  factory :user2, class: User do
    id { 3 }
    name { "user2" }
    email { "user2@dive.com" }
    password { "333333" }
    password_confirmation { "333333" }
    admin { "false" }
  end
end
