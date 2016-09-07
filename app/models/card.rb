### Validates for non-equality of translated and original texts
class CompareValidator < ActiveModel::Validator
  def validate(card)
    if card.original_text.mb_chars.downcase.strip == card.translated_text.mb_chars.downcase.strip
      card.errors[:base] << 'Оригинальный и переведенный текст не должны быть одинаковы'
    end
  end
end

class Card < ActiveRecord::Base
  belongs_to :user
  before_validation :set_review_date
  validates :original_text, :translated_text, presence: true
  validates_with CompareValidator

  def check_card(translate)
    if translated_text.mb_chars.downcase.strip == translate.mb_chars.downcase.strip
      set_review_date
      save
    else
      false
    end
  end

  def set_review_date
    self.review_date = Date.today + 3
  end
end
