# Nipoo!

[![Build Status](https://secure.travis-ci.org/satococoa/nipoo.png)](http://travis-ci.org/satococoa/nipoo)

githubと連携するシンプルな日報ツールです。


# 機能

- github認証です。
- 所属organizationでログインできるユーザーを制限できます。
  - whitelist機能を使用すれば当該organizationに所属していないユーザーでも使えます。
- コメントをつけることができます。
- 最新の日付の日報が初期表示されます。
  - 退勤前に日報を書くようにしている場合、誰かが帰るまでは前日の日報が初期表示、誰かが帰った後は当日の日報が初期表示です。


## 近い将来に搭載予定

- githubから自分のcloseしたissueやcommitの情報を参照する。
- コメントや日報の新着通知。
- コメントや日報への「いいね！」機能。


# 動かし方

1. https://github.com/account/applications からapplicationを登録して下さい。
2. `config/application.yml`を編集して下さい。organizationで縛る場合は`organization`にorganization名を記入して下さい。
organizationに事情があって追加できない人がいる場合は、その人のuidを`whitelist`に登録して下さい。
（":"区切りで複数名指定できます。）
3. あとは普通のrailsアプリです。

以下のように起動してください。

    $ bundle install --without production --path vendor/bundle
    $ rake db:setup
    $ rails server


herokuで動かすときは`heroku add:config GITHUB_KEY=xxxx`のようにして設定して下さい。

