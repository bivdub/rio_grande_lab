require_relative 'spec_helper'
require_relative '../lib/Bluray'

describe Bluray do

  before(:context) do
    @bluray = Bluray.new("sample", 34.50, "director", "producer", "54:00")
    @bluray2 = Bluray.new("sample", 34.50, "director", "producer", "54:00", 10)    
  end

  #check inilization
  describe "initialization" do
    it "should have the Bluray class" do
      expect(@bluray).to be_instance_of(Bluray)
    end
    it "should have a parent class of item" do
      expect(@bluray.class.superclass).to eq(Item)
    end
    it "Should have a director" do
      expect(@bluray.director).to eq("director")
    end
    it "should have an producer" do
      expect(@bluray.producer).to eq("producer")
    end
    it "should have a title" do
      expect(@bluray.name).to eq("sample")
    end
    it "should have a price" do
      expect(@bluray.price).to eq(34.50)
    end
    it "should have a run time" do 
      expect(@bluray.runtime).to eq("54:00")
    end
    it "is assigned a weight" do
      expect(@bluray.weight).to eq(0)
    end
    it "is assigned a shipping price per oz" do
      expect(@bluray.ship_price_per_oz).to eq(1.2)
    end
    it "should set the weight if passed in" do
      expect(@bluray2.weight).to eq(10)
    end
  end
  #check that it is an extended from Item
  #check that it is an instance of Bluray
  #check getters and setters
  describe "Accessors" do
    it "should be able to get quantity" do
      expect(@bluray.quantity).to eq(0)
    end
    it "should be able to get and set name" do
      @bluray.name="New Name"
      expect(@bluray.name).to eq("New Name")
    end   
    it "should be able to get and set price" do
      @bluray.price=44.99
      expect(@bluray.price).to eq(44.99)
    end   
    it "should be able to get and set description" do
      expect(@bluray.description).to eq("")
      @bluray.description="test"
      expect(@bluray.description).to eq("test")
    end    
    it "should be able to get and set director" do
      expect(@bluray.director).to eq("director")
      @bluray.director = "Jim"
      expect(@bluray.director).to eq("Jim")
    end
    it "should be able to get and set producer" do
      expect(@bluray.producer).to eq("producer")
      @bluray.producer = "Run DMC"
      expect(@bluray.producer).to eq("Run DMC")
    end
    it "should be able to get and set run time" do 
      expect(@bluray.runtime).to eq("54:00")
      @bluray.runtime = "10:00"
      expect(@bluray.runtime).to eq("10:00")
    end
    it "should be able to get and set weight" do
      expect(@bluray.weight).to eq(0)
      @bluray.weight = 10
      expect(@bluray.weight).to eq(10)
    end 
  end

  describe "Methods" do
    it "should be able to stock" do
      result = @bluray.stock 5
      expect(result).to eq(true)
      expect(@bluray.quantity).to eq(5)
    end
    it "should not be able to sell more items than we have" do
      result = @bluray.sell 6
      expect(result).to eq(false)
      expect(@bluray.quantity).to eq(5)
    end
    it "should be able to sell items and update quantity" do
      result = @bluray.sell 3
      expect(result).to eq(true)
      expect(@bluray.quantity).to eq(2)
    end  
    it "should be able to return items" do
      result = @bluray.return 3
      expect(@bluray.quantity).to eq(5) 
    end
    it "should return a shipping cost" do
      @bluray.weight = 10
      result = @bluray.ship_price
      expect(result).to eq(12)
    end  
  end
end