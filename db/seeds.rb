require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://quizlet.com/50590/1000-top-used-spanish-words-flash-cards/"))

page.css('.term').each do |words|
  unless (words.css(".lang-es")[0]).nil? || (words.css(".lang-en")[0]).nil?
    Card.create!( original_text: words.css(".lang-es")[0].content, translated_text:  words.css(".lang-en")[0].content)
  end
end
