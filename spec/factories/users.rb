FactoryBot.define do
  
  factory :user do
    name {Faker::Name.last_name}
    password              {"password"}
    password_confirmation {"password"}
    sequence(:email) {Faker::Internet.email}
  end

end