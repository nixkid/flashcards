FactoryGirl.define do
  factory :user do
    email "nix"
    password "nix"
    password_confirmation { password }
  end

end
