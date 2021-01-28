#require 'pry'
#require_relative "../lib/scraper.rb"
#require_relative '../lib/collaborating_quote_class.rb'

class QuotesApp::Category

  attr_accessor :name, :link

  @@all = [ ]

  def initialize (category_hash)
    category_hash.each {|key, value| self.send(("#{key}="), value)}

    @@all << self
  end

  def self.create_from_list(categories_array)                      #Creates category objects with help of the initialize method
    categories_array.each {|category| self.new(category)}
  end

  def self.list
    @@all.map.with_index {|category, index| puts "#{index + 1}. #{category.name}"}
  end

  def self.all
    @@all
  end

  def self.quote_from_category(category_input)                                    # "category_input" is the input number from the user to choose his/her desired caategory from the categories list.
    normalized_input = category_input-1
    chosen_category = @@all[normalized_input]
    quote_hash = QuotesApp::Scraper.category_quote(chosen_category.link)        #returns a hash
    already_exists = QuotesApp::CollaboratingQuote.all.find {|i| i.body == quote_hash[:body]}      # If the quote is already included in the ""@@all" array from the CollaboratingQuote class,
    if already_exists != nil
      already_exists.category = chosen_category                                           # Set the category property for such quote equal to the currently chosen category object
      QuotesApp::CollaboratingQuote.print_quote(already_exists)                                    # Print the qoute
    else                                                                          # If the quote is not included in the "@@all" array from the CollaboratingQuote class,
      new_quote = QuotesApp::CollaboratingQuote.new(quote_hash)                              # Create a new quote object using the "body" key and the "author" key of the quote hash
      new_quote.category = chosen_category                                        # Then set the category property for the newly created quote equal to currently chosen category object
      QuotesApp::CollaboratingQuote.print_quote(new_quote)                                   # and print the newly created quote object
    end
  end
end
