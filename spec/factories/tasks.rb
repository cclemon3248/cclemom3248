FactoryBot.define do
  factory :task do
    title { 'ポケモン' }
    content { '151' }
    deadline { '2022/03/31' }
    status { '未着手' }
    priority { '低' }
    
  end
end
