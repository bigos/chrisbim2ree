# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cart_item do
    shopping_cart_id 1
    photo_id 1
    quantity 3
    price 20
    option "A3"
  end
end
