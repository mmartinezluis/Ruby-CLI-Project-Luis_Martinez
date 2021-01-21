require "pry"
require 'nokogiri'
require 'open-uri'


class Scraper

  def self.random_quote
    # Working quotes page without ads
    random_quote_page = Nokogiri::HTML(open("https://blog.hubspot.com/sales/famous-quotes"))

    all_quotes = [ ]

    random_quote_page.css("#hs_cos_wrapper_post_body p").each do |i|

      all_quotes << { i.text => i.css("em").text.strip }
    end

    final_quotes = all_quotes[3..all_quotes.length-2]

    final_quotes

   end

 end
