FactoryGirl.define do

  factory :card do
    original_text "Home"
    translated_text "Дом"
    review_date Date.current
  end

end