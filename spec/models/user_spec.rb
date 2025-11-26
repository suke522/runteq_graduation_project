require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションチェック' do
    it '有効なユーザーが作成できるか' do
      user = User.new(
        email: "test@example.com",
        password: "password123"
      )
    end
  end
end
