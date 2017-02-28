FactoryGirl.define do
  factory :user do
    email('lachica@test.com')
    password('password')
    password_confirmation('password')
  end
end
