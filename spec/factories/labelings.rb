FactoryBot.define do
  factory :labeling do
    association :label
    association :label_task
  end

end