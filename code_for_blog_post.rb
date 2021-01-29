

#v___________code for blog post______________v

class Quote
  attr_accessor :body, :author

  @@all = [ ]

  def initialize (quote_hash)
    quote_hash.each {|key,value| self.send(("#{key}="), value)}
    @@all << self
  end


  def self.create_from_list (quotes_array)
    quotes_array.each {|quote| self.new(quote_hash)}
  end

  def self.all
    @@all
  end

end

Scraper.random_quotes

quotes_array =  [
                  {:body=>"I didn't fail the test. I just found 100 ways to do it wrong.",
                   :author=>"Benjamin Franklin"},
                 {:body=>
                  "Always bear in mind that your own resolution to success is more important than any other one thing.",
                  :author=>"Abraham Lincoln"}
                ]

NoMethodError: undefined method `{:body=>"I didn't fail the test. I just found 100 ways to do it wrong.", :author=>"Benjamin Franklin"}=' for #<Scraper::Quote:0x0000000001f33558> from (pry):89:in `block in initialize'
