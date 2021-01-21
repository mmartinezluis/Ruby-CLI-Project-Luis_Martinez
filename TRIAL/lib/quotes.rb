require_relative "../lib/scraper.rb"
class Quotes

  attr_accessor :body, :author, :category

  @@all = { }

  binding.pry
  def initialize (body)             #Scraper.random_quote
    @body= body
    Scraper.random_quote.each do |quote|
      @@all = {
        :body => quote.keys,
        :author => quote.values
      }
    end
    Scraper.random_quote.first
  end

  def self.random
    puts "Hello"
  #  chosen = @@all.sample
  #  puts "chosen.body \nchose.author"
  end

end

Quotes.random
