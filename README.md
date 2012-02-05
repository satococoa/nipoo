# Nipoo!について

某弊社向けに作られたシンプルな日報ツールです。  
残念ながら、もしかすると使われないかもしれませんが。


# 動かし方

1. https://github.com/account/applications からapplicationを登録して下さい。
2. `config/application.yml`を編集して下さい。僕のデータ直書きですみません。  


    key: Client ID
    secret: Client Secret
    organization: Organization名


3. 普通のrailsアプリです。以下のように起動。


    $ bundle install --without production --path vendor/bundle
    $ rake db:setup
    $ rails server


herokuで動かすときは`heroku add:config GITHUB_KEY=xxxx`のようにして設定して下さい。

