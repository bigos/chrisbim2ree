# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username 'sample_username'
    email 'user@example.org'
    password 'secret'
    password_confirmation 'secret'
    active true
  end
end
