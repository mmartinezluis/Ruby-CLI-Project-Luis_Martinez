require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative "./quotes_app/version"
require_relative "./quotes_app/collaborating_quote.rb"
require_relative "./quotes_app/author.rb"
require_relative "./quotes_app/category.rb"
require_relative "./quotes_app/cli.rb"
require_relative "./quotes_app/scraper.rb"



module QuotesApp
  class Error < StandardError; end
  # Your code goes here...
end
#binding.pry
