require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインしていない状態でトップページにアクセスした場合、サインページに移動する' do
    # トップページに遷移
    visit root_path

    # ログイン状態でない場合、サインインページに遷移
    expect(current_path).to eq new_user_session_path
  end

  it 'ログインに成功し、トップページに遷移する' do
    # ユーザーをDBに保存
    @user = FactoryBot.create(:user)

    # サインインページへ移動
    visit  new_user_session_path

    # ログイン状態でない場合、サインインページに遷移していることを確認
    expect(current_path).to eq new_user_session_path

    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password

    # ログインボタンをクリック
    click_on("Log in")

    # トップページに遷移
    expect(current_path).to eq root_path
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存
    @user = FactoryBot.create(:user)

    # トップページに遷移
    visit root_path

    # ログイン状態でない場合、サインインページに遷移
    expect(current_path).to eq new_user_session_path

    # 誤ったユーザー情報を入力する
    fill_in 'user_email', with: "test"
    fill_in 'user_password', with: "test"

    # ログインボタンをクリックする
    click_on("Log in")

    # サインインページに戻ってきていることを確認
    expect(current_path).to eq new_user_session_path
  end
  
end