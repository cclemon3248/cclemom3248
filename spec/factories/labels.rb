FactoryBot.define do
  factory :label do
    tag { "おじさん" }
  end

  factory :label2, class: Label do
    tag { "おじいさん" }
  end
end