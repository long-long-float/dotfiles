# vimのインストール方法

## ubuntu

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

## osx

```sh
$ brew install vim --with-lua
```
