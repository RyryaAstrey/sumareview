# スマレビュ

スマートフォンの情報投稿・レビューサイトです。<br>
管理者が様々なスマートフォンの記事を投稿し、<br>
一般ユーザーはその情報を閲覧したりレビューを投稿できたりします。

# イメージ
![image](https://user-images.githubusercontent.com/119737958/227755214-34f03ca7-e251-4441-a7b9-deb62b03edf6.png)
![image](https://user-images.githubusercontent.com/119737958/227755248-92653d14-9b63-47cd-a5da-90427477e4d3.png)

# URL
http://3.114.61.90/<br>
ログイン画面のゲストログインから、メールアドレスとパスワードを入力せずにログインできます。

# 使用技術
- Ruby3.1.2
- Ruby on Rails 6.1.7.2
- Mginx
- Puma
- AWS
  - VPC
  - EC2
  - RDS

# 機能一覧
- ユーザー登録・ログイン機能（devise）
  - 退会機能
- 投稿機能
  - 下書き機能
  - 画像投稿(Active Storage)
  - スライド機能（Swiper）
- コメント機能
  - 参考になった機能（Ajax）
  - 平均点表示機能
- ソート機能
- ページネーション機能（kaminari）
- 検索機能
- URL自動リンク化機能（Rinku）