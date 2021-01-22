
class QuotesCLI

  def call
  "How would you like your quote?"
  1. Random Quote
  2. Quote from category
  3. Quote from random authors list

  input = gets.strip.to_i
  case input

  when 1

    Quotes.random

  when 2

    option2_helper_method_load_categories

    puts "Categories:"

    Category.list

    puts "Type the number for your desired category"

    category_input = gets.strip.to_i

    option2_helper_method_input(category_input)

    category_input

    puts "Retrieving quote ...\n"

    Category.quote_from_category(category_input)

  when 3

    Author.

  else

    puts "Please choose 1, 2 or 3"

    self.call

  end


  def option2_helper_method_load_categories
    Scraper.categories_quote
    categories_array = Scraper.categories_quote
    Category.create_from_list(categories_array)
  end


  def option2_helper_method_input (category_input)
    if category_input <= 0 || category_input > Category.all.count
      puts "Invalid input. Type the number for your desired category"
      option2_helper_method
    else
      break
    end
  end
