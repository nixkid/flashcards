require 'rails_helper'

describe 'Card management', type: :feature do
  let!(:user) { create :user }

  before(:each) do
    login('admin@example.com', 'admin')
  end

  let!(:card) { create :card, user: user }

  it 'creates a new card' do
    visit new_card_path

    fill_in 'card_original_text', with: 'Home'
    fill_in 'card_translated_text', with: 'Дом'
    click_button 'Сохранить карточку'

    expect(page).to have_text('Новая карточка создана')
  end

  it 'checks translation' do
    visit root_path

    fill_in :translate, with: 'Дом'
    click_button 'Проверить!'
    expect(page).to have_text('Все верно')
  end
end
