require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nicknameを入力してください"
    end
    it "emailが空では登録できない" do
      @user.email= ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end
    it "passwordが空では登録できない" do
      @user.password= ""
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません"
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation= ""
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
    end
  end
end