require 'nokogiri'
require 'open-uri'

class Hogwarts::Atlas
    attr_accessor :name, :url
    @@all = []



    def initialize(name, url)
     @name = name
     @url = url
     @@all << self
    end
