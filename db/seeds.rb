User.create!(name:  "Example User",
  email: "example@railstutorial.org",
  password:              "foobar",
  password_confirmation: "foobar")

#その他アカウントを99個作成
99.times do |n|
#ユーザー名も日本語化
Faker::Config.locale = 'ja'
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password)
end

#最初の6アカウントへ50個分のArticleを追加
users = User.order(:created_at).take(6)
50.times do |i|
Faker::Config.locale = 'ja'
article_title = Faker::University.name
article_body = Faker::Address.state
case i % 6
when 0
article_subject = "国語"
when 1
article_subject = "数学"
when 2
article_subject = "英語"
when 3
article_subject = "理科"
when 4
article_subject = "社会"
when 5
article_subject = "その他"
end
users.each { |user| user.article.create!(title: article_title, body: article_body, subject: article_subject) }
end

# UserとArticleのリレーションシップ
users = User.all
articles = Article.all

user1  = users.first
user2  = users.second
article1 = articles.first
article2 = articles.second

users1 = users[1..20]
users2 = users[10..15]
articles1 = articles[3..50]
articles2 = articles[10..40]

# ID1のユーザーがID3〜50の記事をいいねする
articles1.each { |article| user1.goodAdd(article) }
# ID2のユーザーがID10〜40の記事をいいねする
articles2.each { |article| user2.goodAdd(article) }
# ID1から20のユーザーがID1の記事をいいねする
users1.each { |user|  user.goodAdd(article1)}
# ID10から15のユーザーがID2の記事をいいねする
users2.each { |user|  user.goodAdd(article2)}