# connect

## サイト概要
　connectは、プログラミングスクール卒業生が継続して学習を続けるためのコミュニティサイトです。<br>
　スクール在籍中には、メンターに質問すれば解決するためのヒントや回答が返ってきました。しかし、卒業してしまえば自分一人の力で学習を続けるしかありません。エンジニアになるためには、新しい技術を学び続けることが姿勢が大切だと分かっていても、とても不安だと思います。<br>
　connectは、そのような継続学習の不安な人や学習意欲のある人を応援するコミュニティを作れます。<br>
　プログラミング学習に挫折しないため、スクール卒業生でプログラミングコミュニティを作ってみましょう。<br>
 サイトURL: https://connects.tokyo/

## サイトテーマ
プログラミングスクール卒業生が、仲間と繋がり、挫折せずに学習を続けるためのコミュニティプラットフォーム

## テーマを選んだ理由
プログラミングには、継続力と自走力が必要だと分かっていても、自分一人では解決できない問題が絶対に出てくると思います。プログラミングスクールでは、学習に挫折しないため、最初のスタートを支援してくれましたが、学習を続けることは不安だと思います。一緒に頑張って学習した仲間がいれば、これからも継続できそうだと思い、このテーマを選びました。

## ターゲットユーザ
プログラミングスクール卒業生

## 主な利用シーン
・ スクール卒業後に仲間と一緒に学習を続けたい<br>
・ スクール卒業後の独学は不安なのでコミュニティに入りたい<br>
・ スクール卒業生でチームを作りたい

## 使用技術
<h4>フロントエンド</h4>
・ HTML/CSS
・ JavaScript/jQuery
<h4>サーバサイド</h4>
. Ruby-2.5.7
. Ruby_on_rails-5.2.4.3
<h4>テスト</h4>
. RSpec-3.9.2(model/system)
<h4>開発環境</h4>
. Vagrant(2.2.4)
<h4>本番環境</h4>
・ AWS(EC2,nginx)
・ SQL mysql-5.5.62

## 設計
ワイヤーフレーム
https://app.diagrams.net/#G182aBT9t9BTSUVmR414lpv_DW_BdYxk6E

ER図
https://app.diagrams.net/#G1q76P8xzwoXN2qG14Bh_LQ6IGR5vPokxW


## 機能一覧
https://docs.google.com/spreadsheets/d/1GOdSAppRX0EeGDAbTtKwBdFE9tHEGjqEXr-7fRIk6lw/edit#gid=0

<h4>ユーザについて</h4>
・ github認証機能(Omniauth)<br>
・ フォロー・フォロワー機能（非同期）・一覧表示<br>
・ ユーザー間チャット機能（非同期）<br>
<h4>チームについて</h4>
・ チーム所属機能<br>
・ 投稿時にタグを複数付与できる(acts-as-taggable-on)<br>
・ いいねを付けることができる(非同期通信)<br>
・ コメントをつけることができる(非同期通信)<br>
<h4>管理者機能</h4>
・ 管理者によるユーザーやチームの編集等(activeadmin)<br>
・ csv出力(activeadmin)<br>
<h4>その他の機能</h4>
・ ページネーション機能<br>
・ rubocopによるリーダブルコード<br>
・ rspecテスト機能<br>
・ お問い合わせ機能（Action Mailer）



