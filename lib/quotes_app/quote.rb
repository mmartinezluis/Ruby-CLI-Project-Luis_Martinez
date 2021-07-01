class Quote        #This Quote class is not used in the CLI (it is optional quote class)      #This Quote class does not use object collaboration.

  attr_accessor :body, :author, :category

  @@all = [ ]

  def initialize (random_quotes)
    random_quotes.each {|key,value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_list (quotes_array)
    quotes_array.each {|quote| self.new(quote)}
  end

  def self.random
    chosen = @@all.sample
    puts "\"#{chosen.body}\""
    puts "#{chosen.author}"
  end

  def print_quote(quote_object)
    puts "\"#{quote_object.body}\""
    puts "#{quoteo_bject.author}"
  end

  def self.all
    @@all
  end

  def self.delete
    @@all.clear
  end
end
