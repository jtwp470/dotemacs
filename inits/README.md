# インストールされている設定一覧
Emacsの設定は通常`init.el`または`.emacs.d`に追加していくものですが私の場合多すぎたので`init-loader.el`を使って分割しています.

ここでは各ファイルの設定内容を簡潔に記載しています


なお,番号の振り分け方法としては以下のようなルールを採用しています.

| 番号  | 説明 |
|:-----:|------|
| 00    | 最初に読み込むべき設定 |
| 01 ~ 10 | Emacs 本体にもともと備わっているものの設定.|
| 11 ~ 98 | 拡張機能の設定 |
| 50 | 特定の言語に関する設定 |
| 99 | キーバインド設定.特にglobalに割り当てるもの |

## 機能の説明,各プラグインのキーバインド

### OCaml merlin
ドットの後の補完は`TAB`キーです.