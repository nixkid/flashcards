require 'rails_helper'

describe Card do 
  
  before(:each) do
    @card = create(:card)
    @review = Date.today + 3
  end
  
  it "checks original and translated_text aren't equal" do
    expect(@card.original_text).not_to eq(@card.translated_text)
  end
  
  it "should set review date" do
    @card.set_review_date
    expect(@card.review_date).to eq(@review)
  end
  
  it "should autoupdate review date after checking" do
    @card.check_card(original_text)
    expect(@card.review_date).to eq(@review)
  end

end