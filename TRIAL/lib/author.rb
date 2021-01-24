
class Author

  attr_accessor :name, :link

  @@all = [ ]
  @@quotes = [ ]
  @@temporary = [ ]

def initialize (author_hash)
  author_hash.each {|key, value| self.send(("#{key}="), value)}
  @@all << self
end

def self.create_from_list(authors_array)
  authors_array.each {|author| self.new(author)}
end

def self.list
  @@temporary = @@all.sample(10)
  @@temporary.map.with_index {|category, index| puts "#{index + 1}. #{author.name}"}
end

def self.all
  @@all
end

def self.delete
  @@all.clear
end

def quote_from_category (author_input)
  normalized_input = category_input-1
  chosen_author = @@temporary[normalized_input]
  chosen_author.link
  quote_hash = Scraper.author_quote(chosen_author.link)        #returns a hash
  already_exist = Quote.all.select {|i| i.body == quote_hash[:body]}
  if already_exist != [ ]
    already_exist[0].author = chosen_author
    Quote.print_quote(already_exist)
  else
    new_quote = Quote.new(quote_hash)
    new_quote.category = chosen_category
    Quote.print_quote(new_quote)
  end
end


end
