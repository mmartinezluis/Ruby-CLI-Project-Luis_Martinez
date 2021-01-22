
class Category

  attr_accessor :link, :name

  @@all = [ ]

  def initialize (category_hash)
    category_hash.each {|key, value| self.send(("#{key}="), value)}

    @@all << self
  end

  def self.create_from_list(categories_array)
    categories_array.each {|category| self.new(category)}
  end

  def self.list
    @@all.map.with_index {|category, index| puts "#{index + 1}. #{category.name}"}
  end

  def quote_from_category (category_input)
    normalized_input = category_input-1
    chosen_category = @@all[normalized_input]
    chosen_category.link
    quote_hash = Scraper.category_quote(chosen_category.link)        #returns a hash
    final_quote = Quote.new(quote_hash)
    Quote.print_quote(final_quote)
  end

  def self.all
    @@all
  end

end
