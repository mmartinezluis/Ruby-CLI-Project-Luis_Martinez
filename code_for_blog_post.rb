

v___________code for blog post______________v

class Quote

  attr_accessor :body, :author

  @@all = [ ]

  def initialize (quote_hash)
    quote_hash.each {|key,value| self.send(("#{key}="), value)}

    @@all << self
    
  end

  def self.create_from_list (quotes_array)
    quotes_array.each {|quote| self.new(quote)}
  end
