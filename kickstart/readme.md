# 暫定版一撃セットアップ

knife-soloというのを使うところまでいけてないので、暫定のセットアップシェルを
置いておくことにする。

# 前提

Ubuntu12.04が稼働している状態まで作っておく。
クラウド上でも良いし、VagrantでもOK

Rubyはインストールされていない状態を想定しています。
Ubuntu12.04 Serverに関してもインストール直後の状態を想定しています。
apt-get updateとupgradeは行っていない状態からスタートさせます。

# コマンド

Ubuntu12.04にsshで接続し以下のコマンドを実行です。

```
curl -L https://raw.github.com/yuyalush/demo_base/master/kickstart/setup.sh | bash
```

これで完了します。
全部終わったらhttp://(サーバのIP):8080/にブラウザでアクセスしてみてください。
あと、http://(サーバのIP):8080/booksでScaffoldが動いているはずです。


