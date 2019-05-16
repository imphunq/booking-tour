FactoryBot.define do
  factory :tour do
    name {Faker::FunnyName.name}
    departureDay {Faker::Date.forward(23)}
    duration {Faker::Number.between(1, 10)}
    money {Faker::Number.decimal(2)}
  end
end
