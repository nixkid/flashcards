FactoryGirl.define do

  factory :card do
    original_text "I"
    translated_text "Я"
    review_date Date.today
  end

end