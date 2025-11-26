require 'rails_helper'

RSpec.describe Work, type: :model do
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      work = build(:work)
      expect(work).to be_valid
      expect(work.errors).to be_empty
    end

    it 'タイトルが存在しない場合にinvalidになるか validates :title, presence: true' do
      work = build(:work, title: nil)

      expect(work).to be_invalid
      expect(work.errors[:title]).to include("を入力してください")
    end

    it 'タイトルが255文字より多い場合にinvalidになるか validates :title,length: { maximum: 255 }' do
      long_title = 'a' * 256
      work = build(:work, title: long_title)

      expect(work).to be_invalid
      expect(work.errors[:title]).to include("は255文字以内で入力してください")
    end

    it 'メモが65,535文字より多い場合にinvalidになるか validates :memo, length: { maximum: 65_535 }' do
      long_memo = 'a' * 65_536
      work = build(:work, memo: long_memo)

      expect(work).to be_invalid
      expect(work.errors[:memo]).to include("は65535文字以内で入力してください")
    end

    it 'アソシエーション userに属しているか belongs_to :user' do
      work = build(:work, user: nil)

      expect(work).to be_invalid
      expect(work.errors[:user]).to include("を入力してください")
    end
  end
end
