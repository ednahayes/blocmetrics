FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) {|n| "person1#{n}@example.com" }
    password "fakepassword"
    password_confirmation "fakepassword"
  end
end
