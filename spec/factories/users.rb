# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "brett.shollenberger@gmail.com"
    password "foobar29"
    password_confirmation "foobar29"
  end
end
