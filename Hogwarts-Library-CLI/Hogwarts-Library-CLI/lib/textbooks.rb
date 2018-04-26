require 'nokogiri'
require 'open-uri'

class Hogwarts::Textbooks
    attr_accessor :name, :url
    @@all = []



    def initialize(name, url)
     @name = name
     @url = url
     @@all << self
    end

    def self.scrape_textbooks
        textbooks = []
        doc = Nokogiri::HTML(open("https://www.hp-lexicon.org/list/books/textbooks/"))
        info = doc.css(".col-md-12 ul li a")
        info.each do |n|
            textbook = {}
            textbook[:name] = n.text
            textbook[:url] = n.attr("href")
            textbooks << textbook

        end
        textbooks
    end

    def self.all
        @@all
    end
end
