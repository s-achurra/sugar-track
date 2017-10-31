FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    email { generate :email }
    password 'password'
    password_confirmation 'password'
  end

  factory :other_user, class: 'User' do
    email { generate :email }
    password 'password'
    password_confirmation 'password'
  end
end
