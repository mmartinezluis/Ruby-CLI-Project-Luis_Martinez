require "pry"
require 'nokogiri'
require 'open-uri'
require_relative '../lib/quote.rb'

class Scraper

  def self.random_quote
    # Working quotes page without ads
    random_quote_page = Nokogiri::HTML(open("https://blog.hubspot.com/sales/famous-quotes"))

    all_quotes = [ ]

    random_quote_page.css("#hs_cos_wrapper_post_body p").each do |i|

      all_quotes << {:body => i.text.split("\"")[1], :author => i.css("em").text.strip}

    end

    final_quotes = all_quotes.delete_if {|i| i.values.include? (nil)}

  end

 end
#binding.pry
# random_quote_page.css("#hs_cos_wrapper_post_body p")[5].text.split("\"")[1]

# random_quote_page.css("#hs_cos_wrapper_post_body p em")[0].text
Scraper.random_quote
