FactoryGirl.define do
  factory :commute do
    user
    departed_at { 30.minutes.ago }

    trait :completed do
      arrived_at { departed_at + 30.minutes }
    end
  end
end
