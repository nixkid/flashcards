class CompareValidator < ActiveModel::Validator
  def validate(card)
    if card.original_text.downcase.strip == card.translated_text.downcase.strip
       card.errors[:base] << 'Оригинальный и переведенный текст не должны быть равны'
    end
  end
end

class Card < ActiveRecord::Base
  before_create :set_review_date
  validates :original_text, :translated_text, presence: true
  validates_with CompareValidator

  private

    def set_review_date
      self.review_date = Date.today + 3
    end
end
