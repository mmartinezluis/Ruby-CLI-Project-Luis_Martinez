require 'pry'

#v___________code for blog post______________v

class Quote
  attr_accessor :body, :author

  @@all = [ ]

  def initialize (quote_hash)
    quote_hash.each {|key,value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_list (quotes_array)
    quotes_array.each {|quote_hash| self.new(quote_hash)}
  end

  def self.all
    @@all

  end

end


class Quote
  attr_accessor :body, :author, :length

  @@all = [ ]

  def initialize (quotes_array)
    quotes_array.each do |quote_hash|
      quote_hash.each do |key,value|
        self.send(("#{key}="), value)
      end
      @@all<< self
    end
  end

  def self.save
    @@all << self
  end

  def self.all
    @@all
  end
end


class Scraper
end


Quote2.all

quotes_array =  [
                  {:body=>"I didn't fail the test. I just found 100 ways to do it wrong.",
                   :author=>"Benjamin Franklin"},
                   {:body=>
                    "Always bear in mind that your own resolution to success is more important than any other one thing.",
                    :author=>"Abraham Lincoln"}
                ]

reversed_quotes_array =  [
                            {:body=>
                             "Always bear in mind that your own resolution to success is more important than any other one thing.",
                             :author=>"Abraham Lincoln"},
                            {:body=>"I didn't fail the test. I just found 100 ways to do it wrong.",
                             :author=>"Benjamin Franklin"}
                          ]

array= [{:length=>"10 letters", :author=>"Democritus"}, {:length=>"20 words", :author=>"Socrates"}]
array= [{:length=>"10 letters", :author=>"Democritus"}]

 NoMethodError: undefined method `{:body=>"I didn't fail the test. I just found 100 ways to do it wrong.", :author=>"Benjamin Franklin"}=' for #<Scraper::Quote:0x0000000001f33558> from (pry):89:in `block in initialize'

Result from calling initialize with 'quotes_array':
#<Scraper::Quote:0x0000000002b35860
  @author="Abraham Lincoln",
  @body=
   "Always bear in mind that your own resolution to success is more important than any other
 one thing.">]

Examining the @@all array from Quote class:
[#<Scraper::Quote:0x0000000002b35860
  @author="Abraham Lincoln",
  @body=
   "Always bear in mind that your own resolution to success is more important than any other
 one thing.">,
 #<Scraper::Quote:0x0000000002b35860
  @author="Abraham Lincoln",
  @body=
   "Always bear in mind that your own resolution to success is more important than any other
 one thing.">]

Result from calling initialize with 'reversed_quotes_array':
#<Scraper::Quote:0x0000000002a805c8
 @author="Benjamin Franklin",
 @body="I didn't fail the test. I just found 100 ways to do it wrong.">

 Examining the @@all array from Quote class:
 [#<Scraper::Quote:0x0000000002a805c8
  @author="Benjamin Franklin",
  @body="I didn't fail the test. I just found 100 ways to do it wrong.">,
 #<Scraper::Quote:0x0000000002a805c8
  @author="Benjamin Franklin",
  @body="I didn't fail the test. I just found 100 ways to do it wrong.">]

  Objects created:
  [#<Scraper::Quote:0x0000000002a80528
 @author="Benjamin Franklin",
 @body="I didn't fail the test. I just found 100 ways to do it wrong.">,
#<Scraper::Quote:0x0000000002a80460
 @author="Abraham Lincoln",
 @body=
  "Always bear in mind that your own resolution to success is more important than any other
one thing.">]

quotes_array = [
  {:body=>"I didn't fail the test. I just found 100 ways to do it wrong.",
   :author=>"Benjamin Franklin"},
  {:body=>
   "Always bear in mind that your own resolution to success is more important than any other one thing.",
   :author=>"Abraham Lincoln"}
 ]
