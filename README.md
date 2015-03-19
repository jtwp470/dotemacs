# dotemacs
My configuration for Emacs.

I am Emacser. I cannot use Vim. The Emacs is the best editor all over the world!!

## How to setup

1. Download install script from https://raw.githubusercontent.com/jtwp470/dotemacs/master/setup.sh
2. Run the script!
```
    $ wget https://raw.githubusercontent.com/jtwp470/dotemacs/master/setup.sh
    $ ./setup.sh
```
3. If you only want to install dotemacs, please choose *2*. 

## Requirements

* Emacs 24.4 (not 24.3)
* Ricty Powerline ([vim-powerline](https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher) is patched.)

---

## Japanese Section (日本語)
**僕英語力中学生並みなので難しい英語書けないわからない.**

* `~/.emacs.d` Emacsの設定ファイルが詰まったフォルダ.なおこやつはリンクが貼られており実は`~/.dotconfig/dotemacs`に保存されるようになっている.
* `~/.emacs.d/inits/` [init-loader](https://github.com/emacs-jp/init-loader)で読む設定
* `~/.emacs.d/elisp/` 外部から取り込んだEmacs Lispのファイル.MELPAやELPAに登録されていなかったり自作スクリプトはここに保存.なおデフォルトで読み込む.
* `~/.emacs.d/snippets/` Yasnippet用のファイル.

更にパッケージ群の管理には[cask](https://github.com/cask/cask)を使っています.スクリプトで自動インストールされるように設定されていますが場合によってはバイトコンパイルなどに失敗してすべてインストールできていない場合があります.このときは`cask update`などを試してみてください.

問題発生時は`M-x init-loader-show-log`などを見て問題解決に役立ててください.

## その他やること
以下,各環境に依存する処理のため,各位が自分で行ってください.

### Pythonの補完
Pythonの補完を使う場合は別途Pythonのインストールと`pip`が必要です.用意したら

    $ pip install jedi epc

で必要なものがインストールされるはずです.
### PythonでFlycheckを使う
Flycheckでは構文チェックに

* [flake8](https://pypi.python.org/pypi/flake8)
* [Pylint](http://www.pylint.org/)

が使えます.どちらかをインストールすればOKです.

#### Powerlineフォントのインストール
Powerlineフォントをインストールしてください.そうでないと一部きちんと表示できません.私はRictyにパッチを当てました.詳しくは[vim-powerline](https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher)を見てください.

将来的に各環境で自動的にパッチを当てるスクリプトを書くかもしれません.

### C/C++補完をするために
Emacs上でC/C++の補完を使うために[emacs-clang-complete-async](https://github.com/Golevka/emacs-clang-complete-async)というものがあります.これを利用するためには各環境でLLVM-Clangのインストールとビルドが必要になります.以下は一例です.

### Ubuntu

まずは必要なものを一式インストールします.

    $ sudo apt-get install clang libclang-3.4-dev
	$ git clone https://github.com/Golevka/emacs-clang-complete-async
	$ cd emacs-clang-complete-async
	$ make
	$ ldd clang-complete
	$ cp clang-complete ~/.emacs.d

注意事項としては`make`したときに`llvm-config`が見つからないというとき.Ubuntu 14.04上では`llvm-config-3.4`というのがあったので`Makefile`を直接書き換えれば問題ありません.

### Mac OSX
#### Homebrew
Homebrewがインストールされていることが前提です.これが楽で確実だと思います.

    $ brew install emacs-clang-complete-async
	$ ln -s /usr/local/Cellar/emacs-clang-complete-async/clang-complete ~/.emacs.d/clang-complete

#### 自分でビルドしてインストールする方法
Homebrewを使わず自分でインストールする.

OSXでは`binutils`が必要.

とりあえず適当なところにソースコードをダウンロードしたとしてまずMakefile内を書き換えます.

```
    LLVM_CONFIG    := /usr/local/Cellar/llvm/3.4.2/bin/llvm-config
```

これで`make`を実行.もしもエラーで`FILE`がunknownだの出てきたら出てきているファイルの`#include`部に`#include <stdio.h>`を追加しておき再度`make`.これで生成されたあとLinuxなどでは`ldd`コマンドでリンク付できるのだがOSXにはないので`otool -L`で代用します

    $ otool -L clang-complete

これで生成されるはずです.
