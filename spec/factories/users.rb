# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider 'github'
    uid '100004721472441'
    name 'Bob Raymond'
    email 'bob@example.com'
    factory :admin do
      after(:create) {|user| user.add_role :admin}
    end
  end
end
