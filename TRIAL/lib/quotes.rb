require_relative "../lib/scraper.rb"

class Quotes

  attr_accessor :body, :author, :category

  @@all = [ ]

  random_quotes = Scraper.random_quote

  def initialize (random_quotes)
    random_quotes.each {|key,value| self.send(("#{key}="), value)}
    @@all << self
  end



  def self.random
    @@all

  end

end
binding.pry
#  chosen = @@all.sample
#  puts "chosen.body \nchose.author"

Quotes.random
