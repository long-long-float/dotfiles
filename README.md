# Ubuntuインストール後にやること

参考: http://sicklylife.at-ninja.jp/memo/ubuntu1404/settings.html

## 1. ソフトウェアの更新

## 2. Homeディレクトリのダウンロード等の名前を英語にする

```
$ LANG=C xdg-user-dirs-gtk-update
```

## 3. 必要なソフトウェアのインストール

```
sudo apt-get install build-essential bison libreadline6-dev curl git zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libncurses5-dev tmux
```

### tmuxとtmux-powerlineのインストール

* tmux-powerlineをインストールした後はthemes/default.shを編集して表示するものを削らないと表示されない

### powerlineのfontのインストール

参考: http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
Lokaltog/powerlineはDEPLICATEDなのでpowerline/powerlineをインストールする

```
$ mkdir ~/.tmux ; cd ~/.tmux
$ git clone https://github.com/erikw/tmux-powerline.git
```

### javaのインストール

http://qiita.com/civic/items/daefe465600ca45d6c11

### Window Switcherの設定

http://ksino.hatenablog.com/entry/2014/06/08/171030

# vimのインストール方法

## Ubuntu

```sh
$ sudo apt-get install build-essential gettext libncurses5-dev liblua5.1-dev python-dev ruby-dev
$ git clone https://github.com/vim/vim.git
$ cd vim/src
$ git checkout 任意のバージョン
$ ./configure --prefix=$HOME/local --with-features=huge --enable-multibyte --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-fontset --enable-fail-if-missing
$ make ; and make install
```

参考
* http://tti.matrix.jp/blog/2015-05-25/vimをkaoriya（さらに-lua）でビルドする-on-linux-mintcentos6/

## OS X

```sh
$ brew install vim --with-lua
```
