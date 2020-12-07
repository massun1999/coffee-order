# Messaging APIを使用したLINE チャットボット予約システム

## 開発環境

Ruby2.6.5/Ruby on Rails6.0.3.4/Mysql/git hub/Sequel Pro/Messaging API

## 実装した機能

- 応答メッセージの送信
- カルーセルメニューを送信
- カルーセルメニューを押すと予約情報入力ページへ遷移
- 予約情報を保存
- アプリケーション側で予約情報を一覧表示

## テーブル設計

### Usersテーブル

|Column	 |Type	|Option |
|--------|------|-------|
|user_id |string|	      |

### Lattesテーブル

|Column	 |Type	|Option |
|--------|------|-------|
|name    |string|	      |
|time    |time  |       |

### Filtersテーブル

|Column	 |Type	|Option |
|--------|------|-------|
|name    |string|	      |
|time    |time  |       |
