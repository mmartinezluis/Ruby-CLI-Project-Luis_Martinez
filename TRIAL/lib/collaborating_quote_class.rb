require_relative "../lib/scraper.rb"
require_relative "../lib/author.rb"
require 'pry'

class CollaboratingQuote

  attr_accessor :body, :author, :category

  @@all = [ ]

  def initialize (quote_hash)
    author_object = Author.all.select {|i| i.name == quote_hash[:author]}
    if author_object != [ ]
      quote_hash[:author] = author_object
    end
    quote_hash.each {|key,value| self.send(("#{key}="), value)}

    @@all << self
  end

  def self.create_from_list (quotes_array)
    quotes_array.each {|quote| self.new(quote)}
  end

  def self.random
    chosen = @@all.sample
    puts "\"#{chosen.body}\""
    puts "  #{chosen.author.name}"
  end

  def print_quote(quote_object)
    puts "\"#{quote_object.body}\""
    puts "#{quote_object.author.name}"
  end

  def self.all
    @@all
  end
end
#random_quotes = Scraper.random_quote
#  chosen = @@all.sample
#  puts "chosen.body \nchose.author"
