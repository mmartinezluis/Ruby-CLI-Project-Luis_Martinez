class QuotesApp::CollaboratingQuote

  attr_accessor :body, :author, :category

  @@all = [ ]

  def initialize (quote_hash)
    author_object = QuotesApp::Author.all.find {|i| i.name == quote_hash[:author]}           # For any incoming qoute hash, search to see if there is an author object within the Author class that matches the qoute hash's author key                                             
    quote_hash[:author] = author_object if author_object                                      # If a mathcing atuhor object is found replace the value from the incoming qoute hash's author key (originally a string) by the matching author OBJECT from the Author class;
    quote_hash.each {|key,value| self.send(("#{key}="), value)}                              # Mass assign the "body" and "author" keys from the incoming quote hash as properties for the new quote object, and the corresponding values of the hash as the return values for those properties, respectively.
    @@all << self
  end

  def self.create_from_list (quotes_array)
    quotes_array.each {|quote| self.new(quote)}
  end

  def self.random
    chosen = self.all.sample
    puts "\"#{chosen.body}\""
    puts "#{chosen.author.class == String ? chosen.author : chosen.author.name}"
  end

  def self.print_quote(quote_object)
    puts "\"#{quote_object.body}\""
    puts "#{quote_object.author.class == String ? quote_object.author : quote_object.author.name}"
  end

  def self.all
    @@all
  end
end
