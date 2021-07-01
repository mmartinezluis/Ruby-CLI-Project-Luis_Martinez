class QuotesApp::CLI

  def run
    load_databases
    call
  end

  def load_databases
    load_and_create_authors
    load_and_create_collaborating_quotes
    load_and_create_categories
  end

  def call
    main_menu_method
    closing_method
  end

  def main_menu_method
    main_menu_display
    @input = nil
    until @input == "exit"
      @input = gets.strip.downcase
      case @input
      when "1"
        option1_method
      when "2"
        option2_master_method
      when "3"
        option3_master_method                                                                                   # Make the variable "author_input" equal to the return value from the "option3_helper_method_input"
      when "exit"
      else
        puts "Invalid input. Please enter 1, 2 or 3. If you would like to end the session, type exit."
      end
    end
  end

  def main_menu_display
    puts  "Welcome to your Quotes App"
    puts  "How would you like your quote?"
    puts  "  1. Random quote"
    puts  "  2. Quote from category"
    puts  "  3. Quote from random authors list"
    puts  "\nEnter the number for your desired option. If you would like to end the session, type exit."
  end

  def load_and_create_authors
    authors_array = QuotesApp::Scraper.random_authors
    QuotesApp::Author.create_from_list(authors_array)
  end

  def load_and_create_collaborating_quotes
    loaded_quotes = QuotesApp::Scraper.random_quote
    QuotesApp::CollaboratingQuote.create_from_list(loaded_quotes)
  end

  def load_and_create_categories
    categories_array = QuotesApp::Scraper.categories_list
    QuotesApp::Category.create_from_list(categories_array)
  end

  def option1_method
    puts "Retrieving quote...\n"
    puts "\n"
    QuotesApp::CollaboratingQuote.random
    puts "\nFor another quote, press 1; for main menu, press 2; to end the session, press any other key."
    @input = gets.to_i
    if @input == 1
      option1_method
    elsif @input == 2
      main_menu_method
    else
      @input = "exit"
    end
    @input
  end

  def option2_master_method
    puts "Categories:"
    QuotesApp::Category.list
    puts "\nEnter the number for your desired category."
    category_input = option2_helper_method_input
    option2_second_level_method(category_input)
  end

  def option2_helper_method_input
    category_input = gets.to_i
    until (1..QuotesApp::Category.all.count).include?(category_input)
      puts "Invalid input. Please enter the number for your desired category."
      category_input = gets.to_i
    end
    category_input
  end

  def option2_second_level_method(category_input)
    puts "Retrieving quote ..."
    puts "\n"
    QuotesApp::Category.quote_from_category(category_input)
    puts "\nFor another quote from this category, press 1; for main menu, press 2; to end the session, press any other key."
    @input = gets.to_i
    if @input == 1
      option2_second_level_method(category_input)
    elsif @input == 2
      main_menu_method
    else
      @input = "exit"
    end
    @input
  end

  def option3_master_method
    puts "Authors:"
    QuotesApp::Author.list
    puts "\nEnter the number for your desired author."
    author_input = option3_helper_method_input
    option3_second_level_method(author_input)
  end

  def option3_helper_method_input
    author_input = gets.to_i
    until (1..10).include?(author_input)
      puts "Invalid input. Please enter the number for your desired author."
      author_input = gets.to_i
    end
    author_input
  end

  def option3_second_level_method(author_input)
    puts "Retrieving quote ..."
    puts "\n"
    QuotesApp::Author.quote_from_author(author_input)
    puts "\nFor another quote from this author, press 1; for main menu, press 2; to end the session, press any other key."
    @input = gets.to_i
    if @input == 1
      option3_second_level_method(author_input)
    elsif @input == 2
      main_menu_method
    else
      @input = "exit"
    end
    @input
  end

  def closing_method
    puts "Ending session..."
    puts "Session ended."
  end
end