require_relative "../lib/collaborating_quote_class.rb"
require_relative "../lib/scraper.rb"
require_relative "../lib/author.rb"
require_relative "../lib/category.rb"
require "pry"

class QuotesCLI
#  def load_and_create_quotes
#    loaded_quotes = Scraper.random_quote
#    Quote.new(loaded_quotes)
#  end
  def load_and_create_authors
    authors_array = Scraper.random_authors
    Author.create_from_list(authors_array)
  end

  def load_and_create_collaborating_quotes
    loaded_quotes = Scraper.random_quote
    CollaboratingQuote.create_from_list(loaded_quotes)
  end

  def load_and_create_categories
    categories_array = Scraper.categories_list
    Category.create_from_list(categories_array)
  end

  def main_menu
    puts "Welcome to your Quotes App"
    puts "How would you like your quote?"
    puts "  1. Random quote"
    puts "  2. Quote from category"
    puts "  3. Quote from random authors list"
    puts "\nEnter the number for your desired option. If you would like to end the session, enter 'exit'."
  end

  def option1_method
    puts "Retrieving quote...\n"
    puts "\n"
    CollaboratingQuote.random
    puts "\nFor another quote, press 1; for main menu, press 2; to end the session, press any other key."
    end_method_input = gets.to_i
    if end_method_input == 1
      option1_method
    elsif end_method_input == 2
      self.call
    else
      puts "Ending session..."
      puts "Session ended."
    end
  end

  def option2_first_level_method
    puts "Categories:"
    Category.list
    puts "\nType the number for your desired category"
  end

  def option2_second_level_method(category_input)
    puts "Retrieving quote ..."
    puts "\n"
    Category.quote_from_category(category_input)
    puts "\nFor another quote from this category, press 1; for main menu, press 2; to end the session, press any other key."
    end_method_input = gets.to_i
    if end_method_input == 1
      option2_second_level_method(category_input)
    elsif end_method_input == 2
      self.call
    else
      puts "Ending session..."
      puts "Session ended."
    end
  end

  def option3_first_level_method
    puts "Authors:"
    Author.list
    puts "\nType the number for your desired author"
  end

  def option3_second_level_method(author_input)
    puts "Retrieving quote ..."
    puts "\n"
    Author.quote_from_author(author_input)
    puts "\nFor another quote from this author, press 1; for main menu, press 2; to end the session, press any other key."
    end_method_input = gets.to_i
    if end_method_input == 1
      option3_second_level_method(author_input)
    elsif end_method_input == 2
      self.call
    else
      puts "Ending session..."
      puts "Session ended."
    end
  end

  def option2_helper_method_input
    category_input = gets.strip.to_i
    if category_input <= 0 || category_input > Category.all.count
      puts "Invalid input. Please type the number for your desired category."
      option2_helper_method_input
    end
    category_input
  end

  def option3_helper_method_input
    author_input = gets.strip.to_i
    if author_input <= 0 || author_input > 10
      puts "Invalid input. Please type the number for your desired author."
      option3_helper_method_input
    end
    author_input
  end

  def load_databases
    load_and_create_authors
    load_and_create_collaborating_quotes
    load_and_create_categories
  end

  def intro_display
    main_menu
  end

  def main_menu_method
    input = gets.strip
    case input
      when "1"
        option1_method
      when "2"
        option2_first_level_method
        category_input = option2_helper_method_input                    # Make the variable "category_input" equal to the return value from the "option2_helper_method_input"
        option2_second_level_method(category_input)
      when "3"
        option3_first_level_method                                      # Make the variable "author_input" equal to the return value from the "option3_helper_method_input"
        author_input = option3_helper_method_input
        option3_second_level_method(author_input)
      when "exit"
        puts "Ending session..."
        puts "Session ended."
      else
        puts "Invalid input. Please enter 1, 2 or 3. If you would like to end the session, type 'exit'."
        main_menu_method
      end
    end

  def call
    intro_display
    main_menu_method
  end

  def run
    load_databases
    call
  end
#  binding.pry
end

#QuotesCLI.call
#  def option2_helper_method_load_categories
#    Scraper.categories_list
#    categories_array = Scraper.categories_list
#    Category.create_from_list(categories_array)
#  end

#def user_input_method
#  user = gets.strip.to_i
#  if !(1..3).include?(user)
#    puts "Invalid input. Please enter 1, 2 or 3"
#    user_input_method
#  end
#  user
#end
