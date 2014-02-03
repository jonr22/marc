FactoryGirl.define do
  factory :driver do
    sequence(:first_name) { |n| "FirstName#{n}" }
    sequence(:last_name) { |n| "LastName#{n}" }
  end

  factory :season do
    sequence(:name) { |n| "Season#{n}" }
  end

  factory :driver_division do
    sequence(:name) { |n| "Division#{n}" }
  end

  factory :race_class do
    sequence(:name) { |n| "Class#{n}" }
  end

  factory :race do
    date '2014-03-08'
    sequence(:venue) { |n| "Venue#{n}" }
    season
  end

end
