# TodoNote
TodoNote is task management web application.

## Requirements

- Ruby 2.4.1
- Ruby on Rails 5.1.2
- PostgreSQL 9.6.3

## セットアップ方法 (初回の設定とデプロイまでの流れ)

- Herokuのアカウントを登録する
- Heroku CLIをインストールする

  - パッケージをダウンロードしてイントールする場合

    https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up

  - [Homebrew](https://brew.sh/)を使ってコマンドでインストールする場合

    ```
    $ brew install heroku
    ```

- Herokuにログインする

```
$ heroku login
```

- Herokuにアプリケーションを生成する

```
$ heroku create
```

- masterブランチ（以下、master）のソースコードをherokuにpushする（デプロイ）

```
$ git push heroku master
```

- データベースをmigrateする

```
$ heroku run rake db:migrate
```

- アプリケーションをブラウザで確認する

```
$ heroku open
```

## デプロイ方法(2回目以降)
- masterを最新の状態にする

```
$ git checkout master
$ git pull
```

- masterのソースコードをherokuにpushする（デプロイ）

```
$ git push heroku master
```

- データベースをmigrateする

```
$ heroku run rake db:migrate
```

- アプリケーションをブラウザで確認する

```
$ heroku open
```
