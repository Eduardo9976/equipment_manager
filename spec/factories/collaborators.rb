FactoryBot.define do
  factory :collaborator do
    sequence(:name) { |n| "José#{n}" }
    sequence(:email) { |n| "email#{n}@teste.com" }
    sequence(:registration) { |n| "15#{n}" }
  end
end
