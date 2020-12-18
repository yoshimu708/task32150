# アプリケーション名
Task To Manage
# アプリケーション概要
コミュニティでのタスク共有管理ができるアプリケーションです。

このアプリケーションでできることを記述しましょう。
# デプロイURL
AWSデプロイ後
デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。
# テスト用アカウント
テスト用アカウント
nickname 708
email    test@com
password 123abc

ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。
# 利用方法
ヘッダーのルーム作成ボタンからルーム作成ページへ遷移し、タスクの共有管理を行うルームを作る。
作成したルームを選択し、共有タスクを投稿。
状況によってお気に入り・編集・消去を行うことができます。
また、状況報告や質問などユーザー間のコミュニケーションはルーム内のタスク共有ページで行うことができます。

このアプリケーションの利用方法を説明しましょう。
# 目指した課題解決
家族や友人、職場など複数人でのタスクがある場合どうしても進捗状況の確認やタスクの整理、報告などが手間がかかってしまいます。
このアプリケーションを利用することでそれらの手間を省き、共有管理を簡易化することを目指し、作成しました。

このアプリケーションを通じて、どのような人の、どのような課題を解決したかったかを書きましょう。
# 洗い出した用件
スプレッドシート作成後
スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
# 実装した機能について
実装後
実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
# 実装予定の機能
実装後
洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。
# ローカルでの動作方法
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。

# データベース設計
ER図

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
- has_many :tasks

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages
- has_many :tasks

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## tasks テーブル

| Column    | Type       | Options                        |
| --------- | ---------- |------------------------------- |
| task_name | string     | null: false                    |
| status    | string     | null: false                    |
| limit     | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| room      | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user