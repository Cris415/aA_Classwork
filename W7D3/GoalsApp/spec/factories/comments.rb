FactoryBot.define do
  factory :comment do
    goal_id { 1 }
    user_id { 1 }
    body { "MyString" }
  end
end
