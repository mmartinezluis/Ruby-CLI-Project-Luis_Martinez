require_relative "../lib/scraper.rb"
require_relative "../lib/author.rb"
require 'pry'

class CollaboratingQuote

  attr_accessor :body, :author, :category

  @@all = [ ]

  def initialize (quote_hash)
    author_object = Author.all.find {|i| i.name == quote_hash[:author]}
    if author_object != nil
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
    if chosen.author.class == String
      puts "\"#{chosen.body}\""
      puts "  #{chosen.author}"
    else
      puts "\"#{chosen.body}\""
      puts "  #{chosen.author.name}"
    end
  end

  def print_quote(quote_object)
    if quote_object.author == String
      puts "\"#{quote_object.body}\""
      puts "#{quote_object.author}"
    else
      puts "\"#{quote_object.body}\""
      puts "#{quote_object.author.name}"
    end
  end

  def self.todos
    @@all
  end

  def self.all
    @@all
    binding.pry
  end
end
CollaboratingQuote.all
#random_quotes = Scraper.random_quote
#  chosen = @@all.sample
#  puts "chosen.body \nchose.author"
