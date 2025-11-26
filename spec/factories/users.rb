FactoryBot.define do
  factory :user do
    name              { "テスト" }
    sequence(:email) { |n| "test#{n}@example.com" }
    introduction      { "自己紹介文です。" }
    password { "password" }
  end
end
