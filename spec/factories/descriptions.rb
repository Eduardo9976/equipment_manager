FactoryBot.define do
  factory :description do
    product {create:product}
    sequence(:model) { |n| "Modelo#{n}" }
    sequence(:serie_number) { |n| "AYX1234A#{n}" }
    memory { "8gb" }
    hard_drive { "1TB" }
    operational_system { "Windows10" }
    warranty { '18/11/2050' }
  end
end
