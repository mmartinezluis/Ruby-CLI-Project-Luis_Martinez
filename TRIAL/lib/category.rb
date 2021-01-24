require 'pry'
class Category

  attr_accessor :name, :link

  @@all = [ ]

  def initialize (category_hash)
    category_hash.each {|key, value| self.send(("#{key}="), value)}

    @@all << self
  end

  def self.create_from_list(categories_array)                      #Creates category objects with help of the initialize method
    categories_array.each {|category| self.new(category)}
  end

  def self.list
    @@all.map.with_index {|category, index| puts "#{index + 1}. #{category.name}"}
  end

  def self.all
    @@all
  end

  def quote_from_category (category_input)
    normalized_input = category_input-1
    chosen_category = @@all[normalized_input]
    chosen_category.link
    quote_hash = Scraper.category_quote(chosen_category.link)        #returns a hash
    already_exist = Quote.all.select {|i| i.body == quote_hash[:body]}
    if already_exist != [ ]
      already_exist[0].category = chosen_category
      Quote.print_quote(already_exist)
    else
      new_quote = Quote.new(quote_hash)
      new_quote.category = chosen_category
      Quote.print_quote(new_quote)
    end
  end


end
