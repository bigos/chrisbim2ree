# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workshop do
    duration '5'
    title "Isle of Skye 8th - 12th April 2013"    
    content "MyText"
    start_date '12/04/2013'
  end
end
