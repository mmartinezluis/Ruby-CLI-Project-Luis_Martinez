require_relative "../lib/scraper.rb"

class Quote

  attr_accessor :body, :author, :category

  @@all = [ ]

  random_quotes = Scraper.random_quote

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

  def print_quote (quote_object)
    puts "\"#{quote_object.body}\""
    puts "#{quote_object.author}"
  end

end

#  chosen = @@all.sample
#  puts "chosen.body \nchose.author"
