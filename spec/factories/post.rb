FactoryGirl.define do
  factory :post do
    level 120
    user
  end

  factory :second_post, class: "Post" do
    level 120
    user
  end

  factory :post_from_other_user, class: "Post" do
    level 120
    association :user, factory: :other_user
  end
end
