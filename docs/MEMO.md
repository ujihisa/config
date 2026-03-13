# Vim 設定に関する知見メモ

## `<Space>am` マッピングの挙動
* 先に `deol#start` で `~/git/monorepo` に行き deol-edit を立ち上げ、`silent! stopinsert` で挿入モードから抜けたあと `:Gina status --opener=vsplit` へ移行する `s:open_monorepo_with_gina()` を作成。その結果、`Gina` コマンドをタイプした文字列が deol-edit バッファに残る問題を回避した。
* `Gina` を直接呼ぶのではなく `deol` → `Gina` という順序を関数内で明示的に制御することで、逆順にしたい場合はこの関数を呼び出す順序や `split` オプションを入れ替えるだけで済む構造になっている。

## headless 再現のための環境
* `vim -N -Es -u ~/.vimrc` を使い、`XDG_CACHE_HOME`・`VIMINFO`・`TMPDIR`（+`neomru` などのプラグインキャッシュ）を `/tmp` 以下に向けることでホームを書き換えない。
* `--cmd 'let g:vimrc_headless = 1'` を渡し、ヘッドレス時だけロードされる `s:vimrc_headless_gina()` と `command! Gina ...` の stub を有効化。
* `<afile>` を使う autocmd 対応を無効化するため `--cmd 'set eventignore+=BufNew,BufAdd,BufEnter,BufWinEnter'`、swapfile生成を止めるため `--cmd 'set noswapfile'` を加える。
* 必要なら `--cmd 'set viminfofile=/tmp/viminfo'` で変更先を固定。
* 再現コマンド例:
  ```bash
  env XDG_CACHE_HOME=/tmp/vim-cache VIMINFO=/tmp/viminfo TMPDIR=/tmp/vimtmp \
    /usr/bin/vim -N -Es -u ~/.vimrc \
    --cmd 'set nomore' \
    --cmd 'let g:vimrc_headless = 1' \
    --cmd 'set eventignore+=BufNew,BufAdd,BufEnter,BufWinEnter' \
    --cmd 'set noswapfile' \
    -c 'normal! <Space>am' \
    -c 'echom "after gina:" . winnr("$")' \
    -c 'echom "after deol:" . winnr("$")' \
    -c 'qa'
  ```
  これで `after gina:1` → `after deol:1`（stub なのでウィンドウ番号 1）という出力が得られ、`E700/E495/E303` が再現されることなく、実行内容を検証できる。

## 発生していたエラーと対処
* `E700`／`E495`／`E303`：headless で `vital#of('vital')` を import する処理や `<afile>` を含む autocmd・swapfile生成がクラッシュ要因。`g:vimrc_headless` を定義して stub 実装に切り替えることで不在の関数を回避し、`eventignore` と `noswapfile` で autocommand の依存やファイル作成を止めた。
* `E138`：デフォルトの `~/.viminfo` への書き込みが sandbox で拒否されるので `--cmd 'set viminfofile=/tmp/viminfo'` に変更してファイル先を `/tmp` にした。
* `Mac` 判定の `g:V.is_mac()` も `has('mac')` に置き換えて headless で `g:V` を使わないようにした。

## AGENTS.md / docs への反映
* `AGENTS.md` に Subagent 向け検証手順（headless, 環境変数, g:vimrc_headless での stub Gina, eventignore/noswapfile, warnings のログ化）を追記し、次のエージェントが同じ手順を踏めるようにした。
* `~/.vimbundles` を触らず `_vimrc` 側でのみ修正すること、コマンド列と `echom` 出力を報告することも明記。

## まとめと次の確認先
* `<Space>am` → `deol#start` → Gina の順序制御が `s:open_monorepo_with_gina()` により再現可能になったため、GUI でも同じ順序（gina 1 → deol 3）になっているかを確認する。
* headless で再現したログ（`after gina:1`→`after deol:1`）と `AGENTS.md` の手順を次の担当者に伝えれば動作確認が繰り返せる。
