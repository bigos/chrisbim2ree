# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    attachment_file_name "MyString.jpg"
    attachment_content_type "image/jpeg"
    attachment_file_size 1
    attachment_updated_at "2013-03-28 13:18:04"
  end
end
