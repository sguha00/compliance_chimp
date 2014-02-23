# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :standard do
    sequence(:requirement) do |n|
      "1.1.#{n}"
    end
  end
end
