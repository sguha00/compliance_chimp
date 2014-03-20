# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :proof do
    sequence(:image_url) {|i| "http://www.imgur.com/1.1.#{i}.png"}
  end
end
