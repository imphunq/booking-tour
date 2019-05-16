FactoryBot.define do
  factory :location do
    name {Faker::Address.city}
    address {Faker::Address.street_address}
    description {Faker::Lorem.paragraphs(1)}
    picture {Faker::Avatar.image}
    tour_id {Faker::Number.between(1, 10)}
  end
end
