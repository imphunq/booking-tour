FactoryBot.define do
  factory :user do
    email {Faker::Internet.unique.email}
    name {Faker::Name.name}
    address {Faker::Address.city}
    phone {Faker::PhoneNumber.phone_number}
    password {"123456789"}
    password_confirmation {"123456789"}

    trait :user do
      permission {false}
    end

    trait :admin do
      permission {true}
    end
  end
end
