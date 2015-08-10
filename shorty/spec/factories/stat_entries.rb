# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stat_entry do
    link_id 1
    query_string "MyString"
    remote_addr "MyString"
    remote_host "MyString"
    request_method "MyString"
    request_uri "MyString"
    http_accept "MyString"
    http_user_agent "MyString"
    http_accept_encoding "MyString"
    http_accept_language "MyString"
    http_cookie "MyString"
    http_version "MyString"
  end
end
