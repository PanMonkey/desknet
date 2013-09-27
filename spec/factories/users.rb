# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'hoge@example.com'
    password 'hogehoge'
    password_confirmation 'hogehoge'
  end
end
