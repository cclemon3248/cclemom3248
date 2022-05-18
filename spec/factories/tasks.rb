FactoryBot.define do
  factory :task do
    title { 'ポケモン' }
    content { '151' }
    deadline { '2022/03/31' }
    status { '未着手' }
    priority { '低' }
    association :user

    after(:build) do |task|
      label = create(:label)
      label2 = create(:label2)
      task.connects << build(:connect, task: task, label: label)
    end
  end
end