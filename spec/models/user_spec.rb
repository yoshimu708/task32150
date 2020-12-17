require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameに一意性がないと登録できない" do
        @user.save
        @user1 =FactoryBot.build(:user)
        expect(@user1).to be valid 
      end
      it "nicknameが15文字以下であれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nicknameを入力してください"
    end
    it "nicknameに一意性がないと登録できない" do
      @user.save
      @user1 =FactoryBot.build(:user,nickname:@user.nickname)
      @user1.valid?
      expect(@user1.errors.full_messages).to include "Nicknameはすでに存在します"
    end
    it "nicknameが16文字以上では登録できない" do
      @user.nickname= "0000000000000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Nicknameは15文字以内で入力してください"
    end
    it "emailが空では登録できない" do
      @user.email= ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end
    it "passwordが空では登録できない" do
      @user.password= ""
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください","パスワード（確認用）とパスワードの入力が一致しません"
    end
    it "passwordが6文字以下では登録できない" do
      @user.password= ""
      @user.valid?
      expect(@user.errors.full_messages).to include  "パスワードは6文字以上で入力してください"
    end

    it "password_confirmationが空では登録できない" do
      @user.password_confirmation= ""
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
    end

    it "passwordとpassword_confirmationと一致しないと登録できない" do
      @user.password_confirmation= "@user.passowrd"
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
    end
    end
  end
end