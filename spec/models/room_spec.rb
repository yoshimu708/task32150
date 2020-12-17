require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  describe 'ルーム作成' do
    context 'ルーム作成がうまくいく時' do
      it "nameがあれば作成できる" do
        expect(@room).to be_valid
      end
    end

    context 'ルーム作成がうまくいかないとき' do
      it "nameが空だと作成できない" do
        @room.name = ""
        @room.valid?
        expect(@room.errors.full_messages).to include "Nameを入力してください"
      end
  end
end
end
