# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :like do
    likeable_type "MyString"
    likeable_id 1
    user_id 1
  end
end
