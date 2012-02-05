# Nipoo!

[![Build Status](https://secure.travis-ci.org/satococoa/nipoo.png)](http://travis-ci.org/satococoa/nipoo)

某弊社向けに作られたシンプルな日報ツールです。


# 動かし方

1. https://github.com/account/applications からapplicationを登録して下さい。
2. `config/application.yml`を編集して下さい。organizationで縛る場合は`organization`にorganization名を記入して下さい。
3. あとは普通のrailsアプリです。

以下のように起動してください。

    $ bundle install --without production --path vendor/bundle
    $ rake db:setup
    $ rails server


herokuで動かすときは(別ブランチを切るなどして)`config/application.yml`をリポジトリに追加し、`heroku add:config GITHUB_KEY=xxxx`のようにして設定して下さい。

