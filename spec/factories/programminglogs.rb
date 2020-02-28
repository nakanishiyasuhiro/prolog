FactoryBot.define do

  # コントローラテスト用
  factory :programminglog do
    title {"yasumi"}
    text {"hello!"}
    image {"hoge.png"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end

end