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
    user
  end

  factory :location do
    sequence(:lat) { |n| n }
    sequence(:lng) { |n| n }
    sequence(:reverse) { |n| "city #{n}" }
    located_at DateTime.now
    tour
  end

end
