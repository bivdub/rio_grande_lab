# You are on your own... good luck.

require_relative 'spec_helper'
require_relative '../lib/Movie'

describe Movie do

  before(:context) do
    @movie = Movie.new("Generic Item",1.99, "director", "producer", "54:00")
    @movie2 = Movie.new("Generic Item",1.99, "director", "producer", "54:00", 10)
  end

  describe "Initialization" do
    it "is an instance of the Movie class" do
      expect(@movie).to be_instance_of(Movie)
    end
    it "should have a parent class of Digitalitem" do
      expect(@movie.class.superclass).to eq(Digitalitem)
    end
    it "is assigned a name" do
      expect(@movie.name).to eq("Generic Item")
    end
    it "is assigned a price" do
      expect(@movie.price).to eq(1.99)
    end
    it "Should have a director" do
      expect(@movie.director).to eq("director")
    end
    it "should have an producer" do
      expect(@movie.producer).to eq("producer")
    end
    it "should have a run time" do 
      expect(@movie.runtime).to eq("54:00")
    end
    it "is assigned a weight of -1" do
      expect(@movie.weight).to eq(-1)
    end
    it "should set Download size if passed in" do
      expect(@movie2.download_size).to eq(10)
    end
    it "should have a download size of 0 if not specified" do
      expect(@movie.download_size).to eql(0)
    end
  end

  describe "Accessors" do
    it "should be able to get quantity" do
      expect(@movie.quantity).to eq(1)
    end
    it "should be able to get and set name" do
      @movie.name="New Name"
      expect(@movie.name).to eq("New Name")
    end   
    it "should be able to get and set price" do
      @movie.price=44.99
      expect(@movie.price).to eq(44.99)
    end   
    it "should be able to get and set description" do
      expect(@movie.description).to eq("")
      @movie.description="test"
      expect(@movie.description).to eq("test")
    end    
    it "should be able to get and set director" do
      expect(@movie.director).to eq("director")
      @movie.director = "Jim"
      expect(@movie.director).to eq("Jim")
    end
    it "should be able to get and set producer" do
      expect(@movie.producer).to eq("producer")
      @movie.producer = "Run DMC"
      expect(@movie.producer).to eq("Run DMC")
    end
    it "should be able to get and set run time" do 
      expect(@movie.runtime).to eq("54:00")
      @movie.runtime = "10:00"
      expect(@movie.runtime).to eq("10:00")
    end
  end

  describe "Methods" do
    it "SHOULDN'T be able to stock" do
      result = @movie.stock 5
      expect(result).to eq(false)
      expect(@movie.quantity).to eq(1)
    end
    it "should be able to sell any quantity" do
      result = @movie.sell 6
      expect(result).to eq(true)
      expect(@movie.quantity).to eq(1)
    end   
    it "should accept returns and leave inventory at 1" do
      @movie.return 5
      expect(@movie.quantity).to eq(1)
    end 
    it "should return false when ship_price is called" do
      expect(@movie.ship_price).to eq(false)
    end
  end

end