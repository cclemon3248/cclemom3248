FactoryBot.define do
  factory :task do
    title { 'a' }
    content { 'b' }
    deadline { '2022/03/31' }
    priority { 'c' }
    status { 'd' }
  end
end
