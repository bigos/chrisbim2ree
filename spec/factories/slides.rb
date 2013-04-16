# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slide do
    caption "MyString"
    position 1
    visible false
  end
end
