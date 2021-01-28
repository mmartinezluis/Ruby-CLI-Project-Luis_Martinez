require "quotes-app/version"
require_relative "../lib/collaborating_quote_class.rb"
require_relative "../lib/scraper.rb"
require_relative "../lib/author.rb"
require_relative "../lib/category.rb"

require 'pry'
require 'nokogiri'
require 'open-uri'

module QuotesApp
  class Error < StandardError; end
  # Your code goes here...
end
