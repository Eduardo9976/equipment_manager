FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Produto#{n}" }
    manufacturer
  end
end
