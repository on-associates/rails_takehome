FactoryBot.define do
  factory :activity do
    name { "Play Game" }
    address { "Central Park" }
    starts_at { "2022-03-04 11:00:00" }
    ends_at { "2022-03-06 19:00:00" }
  end
end
