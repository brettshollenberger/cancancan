FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "email#{n}@gmail.com"}
    password "foobar29"
    password_confirmation "foobar29"
    role "user"
    factory :admin do
      role "admin"
    end
  end

  factory :movie do
    title "Harassment Park"
    description "A devestating tale dinos and assault."
  end

  factory :review do
    body "This movie was great!"
    movie
  end
end
