FactoryGirl.define do
  factory :user do
    email 'admin@example.com'
    password 'admin'
    password_confirmation { password }
  end
end
