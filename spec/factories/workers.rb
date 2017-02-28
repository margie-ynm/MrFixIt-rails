FactoryGirl.define do
  factory :worker do
    email('lachica@test.com')
    password('password')
    password_confirmation('password')
  end
end
