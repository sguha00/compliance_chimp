# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :requirement do
    sequence(:name) {|i| "1.1.#{i}"}
    description "Lorem ipsum"
  end
end
