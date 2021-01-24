require_relative "../lib/quote.rb"
require_relative "../lib/scraper.rb"

class QuotesCLI

  def load_and_create_quotes
    Scraper.random_quote
    loaded_quotes = Scraper.random_quote
    Quote.new(loaded_quotes)
  end

  def load_and_create_categories
    Scraper.categories_list
    categories_array = Scraper.categories_list
    Category.create_from_list(categories_array)
  end

  def load_and_create_authors
    Scraper.random_authors
    authors_array = Scraper.categories_list
    #Relate quote class and author class
    Category.create_from_list(categories_array)
  end

  def call

  "How would you like your quote?"
  1. Random Quote
  2. Quote from category
  3. Quote from random authors list

  input = gets.strip.to_i

  case input

  when 1

    Quote.random

  when 2

    option2_helper_method_load_categories

    puts "Categories:"

    Category.list

    puts "Type the number for your desired category"

    option2_helper_method_input

    category_input = option2_helper_method_input          # Make the variable "category_input" equal to the return value from the "option2_helper_method_input"

    puts "Retrieving quote ...\n"

    Category.quote_from_category(category_input)

  when 3

    Author.

  else

    puts "Please choose 1, 2 or 3"

    self.call

  end






#  def option2_helper_method_load_categories
#    Scraper.categories_list
#    categories_array = Scraper.categories_list
#    Category.create_from_list(categories_array)
#  end


  def option2_helper_method_input
    category_input = gets.strip.to_i
    if category_input <= 0 || category_input > Category.all.count
      puts "Invalid input. Type the number for your desired category"
      option2_helper_method_input
    end
    category_input
  end

end
