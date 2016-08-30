# ruby encoding: utf-8
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('http://masterrussian.com/vocabulary/most_common_words.htm'))

page.css('tr').each do |words|
  unless (words.css('td')[2]).nil? || (words.css('td')[3]).nil?
    Card.create!(original_text: words.css('td')[2].content, translated_text: words.css('td')[3].content, user_id: User.first.id)
  end
end
