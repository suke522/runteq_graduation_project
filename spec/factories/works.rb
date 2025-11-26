FactoryBot.define do
  factory :work do
    title { "テストタイトル" }
    memo { "テストメモ" }
    status { :incomplete }

    association :user
  end
end
