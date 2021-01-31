#require_relative "../lib/scraper.rb"
#require 'pry'
                    #This Quote class does not use object collaboration.
class Quote

  attr_accessor :body, :author, :category

  @@all = [ ]

  def initialize (random_quotes)
    random_quotes.each {|key,value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_list (quotes_array)
    quotes_array.each {|quote| self.new(quote)}
  end


  def self.random
    chosen = @@all.sample
    puts "\"#{chosen.body}\""
    puts "#{chosen.author}"
  end

  def print_quote(quoteobject)
    puts "\"#{quoteobject.body}\""
    puts "#{quoteobject.author}"
  end

  def self.all
    @@all
  end

  def self.delete
    @@all.clear
  end

end
#random_quotes = Scraper.random_quote
#  chosen = @@all.sample
#  puts "chosen.body \nchose.author"
