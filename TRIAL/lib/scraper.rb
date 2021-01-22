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

    filteredl_quotes = all_quotes.delete_if {|i| i.values.include? (nil)}.uniq
    binding.pry
  end

#binding.pry
# random_quote_page.css("#hs_cos_wrapper_post_body p")[5].text.split("\"")[1]

# random_quote_page.css("#hs_cos_wrapper_post_body p em")[0].text


  def self.categories_quote

    categories_quote_page = Nokogiri::HTML(open("https://www.brainyquote.com/"))

    all_categories = [ ]

    categories_quote_page.css(".homeGridBox #allTopics .bqLn").each do |i|

      all_categories << {:name => i.text, :link => "https://www.brainyquotes#{i.css("a").attribute("href").value}"}

    end

    selected_categories = all_categories.select {|hash| hash[:name]== "Attitude" || hash[:name]== "Life" || hash[:name]== "Motivational" || hash[:name]== "Wisdom" || hash[:name]== "Inspirational"}

  end

  def category_quote(category_link)

    category_quote_page = Nokogiri::HTML(open("https://www.brainyquote.com/topics/love-quotes"))
    category_quote_page = Nokogiri::HTML(open(category_link))

    category_quotes = [ ]

    category_quote_page.css("#quotesList .m-brick").each do |i|

      category_quotes << {:body => i.css("a.b-qt").text, :author => i.css("a.bq-aut").text}

   end

   category_quotes.sample








end
Scraper.random_quote
