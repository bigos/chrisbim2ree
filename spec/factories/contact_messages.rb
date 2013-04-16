# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_message do
    from "james.bomd@example.comg"
    subject "My Subject String"
    message "MyText "
  end
end
