10.times do |n|
  Label.create!(
    tag: "あ#{n}"
  )
end

10.times do |n|
  User.create!(
    name: "cclemon#{7000 + n}@gmail.com",
    email: "テスト太郎#{n + 1}",
    password: "djdjdjdj1"
  )
end

User.all.each do |user|
  user.tasks.create!(title: "あ", content: "あ", deadline: "2022/05.01", priority: 1, status: "未着手")
end