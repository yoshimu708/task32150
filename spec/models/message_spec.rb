require 'rails_helper'

RSpec.describe Message, type: :model do

  before do

    @message = FactoryBot.build(:message)
  end

  describe 'ユーザー新規登録' do
    context 'メッセージ投稿がうまくいくとき' do
      it "contentが存在すれば登録できる" do
        expect(@message).to be_valid
      end
  
      it 'imageが空でも保存できること' do
        @message.image = nil
        expect(@message).to be_valid
      end
  
      it 'contentとimageが空では保存できないこと' do
        @message.content = nil
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Contentを入力してください")
      end
  
      it 'roomが紐付いていないと保存できないこと' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Roomを入力してください")
      end
  
      it 'userが紐付いていないと保存できないこと' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Userを入力してください")
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
