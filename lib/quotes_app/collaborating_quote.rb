class QuotesApp::CollaboratingQuote

  attr_accessor :body, :author, :category

  @@all = [ ]

  def initialize (quote_hash)
    author_object = QuotesApp::Author.all.find {|i| i.name == quote_hash[:author]}           # For any incoming qoute hash, search to see if there is an author object within the Author class that that matches the qoute hash's author key
    if author_object != nil                                                                  # If a mathcing atuhor object is found,
      quote_hash[:author] = author_object                                                    # replace the value from the incoming qoute hash's author key (originally a string) by the matching author OBJECT from the Author class;
    end                                                                                      # that is, make the "author" property of the quote equal to an OBJECT instead of a STRING; if no matching author object is found, leave the "author" property of the quote as a STRING
    quote_hash.each {|key,value| self.send(("#{key}="), value)}                              # Mass assign the "body" and "author" keys from the incoming quote hash as properties for the new quote object, and the corresponding values of the hash as the return values for those properties, respectively.
    @@all << self
  end

  def self.create_from_list (quotes_array)
    quotes_array.each {|quote| self.new(quote)}
  end

  def self.random
    chosen = @@all.sample
    if chosen.author.class == String
      puts "\"#{chosen.body}\""
      puts "#{chosen.author}"
    else
      puts "\"#{chosen.body}\""
      puts "#{chosen.author.name}"
    end
  end

  def self.print_quote(quote_object)
    if quote_object.author.class == String
      puts "\"#{quote_object.body}\""
      puts "#{quote_object.author}"
    else
      puts "\"#{quote_object.body}\""
      puts "#{quote_object.author.name}"
    end
  end

  def self.all
    @@all
  end
end
