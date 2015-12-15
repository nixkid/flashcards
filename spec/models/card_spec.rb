require 'rails_helper'

describe Card do 
  
  before(:each) do
    @card = create(:card)
    @review = Date.current + 3.days
  end

  it "should set review date" do
    @card.set_review_date
    expect(@card.review_date).to eq(@review)
  end
  
  it "should autoupdate review date after checking" do
    @card.check_card(@card.translated_text)
    expect(@card.review_date).to eq(@review)
  end
  
  it "checks right translation" do
    expect(@card.check_card("Дом")).to be true
  end
  
  it "checks right translation even with not best arguments" do
    expect(@card.check_card("дОМ")).to be true
  end
  
  it "returns false to wrong translation" do
    expect(@card.check_card("Он")).to be false
  end
  
  subject { @card }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  
end