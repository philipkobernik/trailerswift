FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    sequence(:band_name) { |n| "band #{n}" }
    sequence(:band_slug) { |n| "band_#{n}" }
    password 'password'

    factory :admin do
      admin true
    end
  end

  factory :tour do
    sequence(:name) { |n| "tour #{n}" }
  end

end
