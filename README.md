# Ruby on Rails チュートリアルのサンプルアプリケーション

これは、次の教材で作られたサンプルアプリケーションです。
[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
（第6版）
[Michael Hartl](https://www.michaelhartl.com/) 著

## ライセンス

[Ruby on Rails チュートリアル](https://railstutorial.jp/)内にある
ソースコードはMITライセンスとBeerwareライセンスのもとで公開されています。
詳細は [LICENSE.md](LICENSE.md) をご覧ください。

## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで必要になる RubyGems をインストールします。

```
$ bundle install --without production
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ rails test
```

テストが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

詳しくは、[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
を参考にしてください。

## Docker Compose で動作させる

[Docker](https://www.docker.com/) および [Docker Compose](https://docs.docker.com/compose/) で動作させるための設定を用意しています。

### 初期設定

`.env.example` をコピーして `.env` というファイルを作成します。

```
$ cp .env.example .env
```

`.env` ファイルを編集することでポート番号等を変更することができます。

`.env` ファイルの編集が完了したら以下のコマンドを実行します。

```
$ make setup
```

コマンドの実行が終了したら、次のコマンドを実行して Docker コンテナが起動していることを確認してください（ポート番号は `.env` に設定した値によって変わります）。

```
$ docker-compose ps
                 Name                                Command               State          Ports
-------------------------------------------------------------------------------------------------------
rails-tutorial-60-sample-app_app_1        entrypoint.sh bash -c rm - ...   Up      0.0.0.0:80->3000/tcp
rails-tutorial-60-sample-app_database_1   docker-entrypoint.sh postgres    Up      5432/tcp
```

### 使い方

一度初期設定をしたあと、次のコマンドで利用できます。

#### アプリケーションを起動

```
$ make up
```

#### アプリケーションを停止

停止後、Docker コンテナは削除されます。

```
$ make down
```

#### `rails` の実行

`CMD` 変数に実行コマンドを指定します。

```
$ make rails CMD="db:migrate"
```

#### `yarn` の実行

`rails` と同様に `CMD` 変数に実行コマンドを指定します。

```
$ make yarn CMD="install"
```

### トラブルシューティング

#### app のコンテナが異常終了してしまう

次のコマンドでログを確認します。

```
$ docker-compose logs app
```

ログ中に `Your Yarn packages are out of date!` というメッセージが確認できた場合、次のコマンドを実行することで解消が見込めます。

```
$ make yarn/check-files
```
