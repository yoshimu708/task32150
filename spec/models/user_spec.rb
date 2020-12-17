require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user =FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      binding.pry
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
    end
  end
end