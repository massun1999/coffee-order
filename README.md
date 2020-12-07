# Messaging APIを使用したLINE チャットボット予約システム

## 概要

Messaging APIを用いてLINEのBotから予約注文が可能。
ユーザーが「注文」とメッセージを送るとカルーセルメニューが表示します。
カルーセルメニューの「Order」押すと予約情報を入力するページへ遷移。
フォームの入力ができると情報がデータベースへ保存されます。
保存された情報はアプリケーション側で一覧表示されます。

## 実装した機能

- Messaging APIの導入
- メッセージイベントに対する応答メッセージ
- フォローイベントでユーザー情報を保存
- カルーセルテンプレート使用
- 予約情報の登録機能
- 予約情報の一覧表示

## 今後実装したい機能

- ユーザーへのプッシュメッセージの送信
- テストコードの実装
- フロントを整える
- カルーセルの画像の表示


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
