FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    title { "test_title" }
    content { 'test_content' }
    deadline { "2020/01/01" }
    priority { "未着手" }
    status { "低" }
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    title { "test_title" }
    content { 'test_content' }
    deadline { "2020/01/11" }
    priority { "未着手" }
    status { "低" }
  end
end