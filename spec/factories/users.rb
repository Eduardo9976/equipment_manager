FactoryBot.define do
  factory :user do
    sequence(:email) {  |n| "user#{n}@user.com.br" }
    password { '12345678' }
  end
end
