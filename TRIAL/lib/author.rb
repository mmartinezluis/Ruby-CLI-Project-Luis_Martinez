
class Author

  attr_accessor :name, :link

  @@all = [ ]
  @@temporary = [ ]

  def initialize (author_hash)
    author_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_list(authors_array)                                              # The "authors_array" is equal to the return array from the Scraper class' "self.random_authors" method
    authors_array.each {|author| self.new(author)}
  end

  def self.list
    @@temporary = @@all.sample(10)                                                         # From all of the author objects, chosee 10 randomly
    @@temporary.map.with_index {|author, index| puts "#{index + 1}. #{author.name}"}       # Display the 10 chosen random authors in list form
  end

  def self.all
    @@all
  end

  def self.quote_from_author (author_input)                                           # "author_input" is the input number from the user to choose his/her desired atuhor from the atuhors list.
    normalized_input = author_input-1
    chosen_author = @@temporary[normalized_input]
    quote_hash = Scraper.author_quote(chosen_author.link)                             #returns a hash
    already_exists = CollaboratingQuote.all.find {|i| i.body == quote_hash[:body]}    # If the quote is already included in the ""@@all" array from the CollaboratingQuote class,
    if already_exists != nil
      CollaboratingQuote.print_quote(already_exists)                                    # print the quote
    else                                                                              # If the quote is not included in the "all" array from the CollaboratingQuote class,
      new_quote = CollaboratingQuote.new(quote_hash)                                  # Create a new quote object using hte "body" property and the "author" property of the qoute hash
      CollaboratingQuote.print_quote(new_quote)                                       # and print the new quote object
    end
  end
end





#def quote_from_author (author_input)
#  normalized_input = category_input-1
#  chosen_author = @@temporary[normalized_input]
#  chosen_author.link
#  quote_hash = Scraper.author_quote(chosen_author.link)        #returns a hash
#  already_exist = Quote.all.select {|i| i.body == quote_hash[:body]}
#  if already_exist != [ ]
#    already_exist[0].author = chosen_author
#    Quote.print_quote(already_exist)
#  else
#    new_quote = Quote.new(quote_hash)
#    new_quote.author = chosen_author
#    Quote.print_quote(new_quote)
#  end
#end
