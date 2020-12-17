require 'rails_helper'

RSpec.describe Message, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
    @message = FactoryBot.build(:message, user_id:@user.id, room_id:@room.id)
  end

  describe 'ユーザー新規登録' do
    context 'メッセージ投稿がうまくいくとき' do
      it "contentが存在すれば登録できる" do
        expect(@message).to be_valid
      end
    end

    context 'メッセージ投稿がうまくいかないとき' do
    it "contentが空だと登録できない" do
      @message.content = ""
      @message.valid?
      expect(@message.errors.full_messages).to include "Contentを入力してください"
    end
  end
  end
end
