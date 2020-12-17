require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
    @task = FactoryBot.build(:task, user_id:@user.id, room_id:@room.id)
  end

  describe 'ユーザー新規登録' do
    context 'メッセージ投稿がうまくいくとき' do
      it "task_name,status,limitが存在すれば登録できる" do
        expect(@task).to be_valid
      end
    end

    context 'メッセージ投稿がうまくいかないとき' do
    it "task_nameが空だと登録できない" do
      @task.task_name = ""
      @task.valid?
      expect(@task.errors.full_messages).to include "Task nameを入力してください"
    end
    it "task_nameが空だと登録できない" do
      @task.status = ""
      @task.valid?
      expect(@task.errors.full_messages).to include "Statusを入力してください"
    end
    it "task_nameが空だと登録できない" do
      @task.limit = ""
      @task.valid?
      expect(@task.errors.full_messages).to include "Limitを入力してください"
    end
  end
  end
end
