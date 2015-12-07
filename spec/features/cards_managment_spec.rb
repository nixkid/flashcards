require 'rails_helper'

describe "Card management", :type => :feature do
    
  let!(:card) { create :card }
  
  it "User creates a new card" do
    visit new_card_path

    fill_in "Светлая сторона карточки", with: "My Card"
    fill_in "Темная сторона карточки", with: "Моя карта"
    click_button "Сохранить карточку"

    expect(page).to have_text("Новая карточка создана")
  end
  
  # it "checks translation" do
  #   visit root_path
  #   
  #   fill_in :translate, with: "Home"
  #   click_button 'Проверить!'
  #   expect(page).to eq root_path
  # end
end