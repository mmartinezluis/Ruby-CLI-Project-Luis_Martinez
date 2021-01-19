require 'nokogiri'
require 'open-uri'
require "pry"

class Scraper

  # There are 4 types of quotes in the source website
  # The #ramdom_quote class method will scrape the 4 types of quotes into 4 hashes,
  # then it will combine the 4 hashes into 1 hash containing oall of the quotes

  def self.random_quote

    random_quote_page = Nokogiri::HTML(open("https://www.brainyquote.com/top_100_quotes"))

    binding.pry
    #Type 1 quotes scraping: class = "col-md-4"
    trial_1= random_quote_page.css(".col-md-4")             # 18

    trial_1= random_quote_page.css(".col-content")          # 23
    trial_1= random_quote_page.css(".container-fluid .row .col-md-8")
    trial_11= random_quote_page.css("#top100data .col-content .block-quote a").collect {|i| i.text}
    trial_12= random_quote_page.css("#top100data .col-content .block-quote a").select {|i| i.text}
    #Type 2 quote scraping: class = "col-md-8"                3
    trial_2 = random_quote_page.css(".col-md-8")

    #Type 3 quote scraping: class = "fullwidth-section"       2
    trial_3 = random_quote_page.css(".fullwidth-section")
    trial_3 = random_quote_page.css("div.fullwidth-section")
    trial_33 = random_quote_page.css(".fullwidth–content")
    trial_333 = random_quote_page.css("blockquote")
    trial_333 = random_quote_page.css("blockquote a").text
    trial_3333= random_quote_page.css("div.fullwidth-content")
    #Type 4 quote scraping: class = "isotope-item"            8
    trial_4 = random_quote_page.css(".isotope-item")
    trial_4 = random_quote_page.css(".isotope-grid .masonry-quote a").collect {|i| i.text}   #
    trial_4 = random_quote_page.css("#top100data .isotope-grid .masonry-quote a").collect {|i| i.text}

    trial_5 =random_quote_page.css("div")
    trial_5 =random_quote_page.css("div blockquote")
    trial_5 =random_quote_page.css("div div blockquote a").text
    trial_33 = random_quote_page.css(".fullwidth–content")


  end

end
