FactoryBot.define do

  # モデルテスト用
  factory :programminglog do
    title {Faker::JapaneseMedia::OnePiece.character}
    text  {Faker::Lorem.sentence}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end

end