class CompareValidator < ActiveModel::Validator
  def validate(card)
    if card.original_text.mb_chars.downcase.strip == card.translated_text.mb_chars.downcase.strip
        card.errors[:base] << 'Оригинальный и переведенный текст не должны быть равны'
    end
  end
end

class Card < ActiveRecord::Base
  before_create :set_review_date
  validates :original_text, :translated_text, presence: true
  validates_with CompareValidator

  scope :random_card, -> { where('review_date <= ?', Time.current).order("RANDOM()").take }

  def check_card(translate)
    if self.translated_text.mb_chars.downcase.strip == translate.mb_chars.downcase.strip
      set_review_date
      self.save
    end
  end

  private

  def set_review_date
    self.review_date = Date.today + 3
  end
  
end
