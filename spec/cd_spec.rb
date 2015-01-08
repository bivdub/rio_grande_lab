require_relative 'spec_helper'
require_relative '../lib/Cd'

describe Cd do

  before(:context) do
    @cd = Cd.new("sample", 34.50, 10, "artist", "54:00")
    @cd2 = Cd.new("sample", 34.50, 10, "artist", "54:00", 10)
  end

  #check inilization
  describe "initialization" do
    it "should have the Cd class" do
      expect(@cd).to be_instance_of(Cd)
    end
    it "should have a parent class of item" do
      expect(@cd.class.superclass).to eq(Item)
    end
    it "Should have a number of tracks" do
      expect(@cd.tracks).to eq(10)
    end
    it "should have an artist" do
      expect(@cd.artist).to eq("artist")
    end
    it "should have a title" do
      expect(@cd.name).to eq("sample")
    end
    it "should have a price" do
      expect(@cd.price).to eq(34.50)
    end
    it "should have a run time" do 
      expect(@cd.runtime).to eq("54:00")
    end
    it "should have an integer for track number" do
      expect(@cd.tracks.is_a? Integer).to eq(true)
    end
    it "is assigned a weight" do
      expect(@cd.weight).to eq(0)
    end
    it "is assigned a shipping price per oz" do
      expect(@cd.ship_price_per_oz).to eq(1.2)
    end
    it "should set the weight if passed in" do
      expect(@cd2.weight).to eq(10)
    end
  end
  #check that it is an extended from Item
  #check that it is an instance of Cd
  #check getters and setters
  describe "Accessors" do
    it "should be able to get quantity" do
      expect(@cd.quantity).to eq(0)
    end
    it "should be able to get and set name" do
      @cd.name="New Name"
      expect(@cd.name).to eq("New Name")
    end   
    it "should be able to get and set price" do
      @cd.price=44.99
      expect(@cd.price).to eq(44.99)
    end   
    it "should be able to get and set description" do
      expect(@cd.description).to eq("")
      @cd.description="test"
      expect(@cd.description).to eq("test")
    end    
    it "should be able to get and set track number" do
      expect(@cd.tracks).to eq(10)
      @cd.tracks = 15
      expect(@cd.tracks).to eq(15)
    end
    it "should be able to get and set artist" do
      expect(@cd.artist).to eq("artist")
      @cd.artist = "Run DMC"
      expect(@cd.artist).to eq("Run DMC")
    end
    it "should be able to get and set run time" do 
      expect(@cd.runtime).to eq("54:00")
      @cd.runtime = "10:00"
      expect(@cd.runtime).to eq("10:00")
    end
    it "should be able to get and set weight" do
      expect(@cd.weight).to eq(0)
      @cd.weight = 10
      expect(@cd.weight).to eq(10)
    end 
  end

  describe "Methods" do
    it "should be able to stock" do
      result = @cd.stock 5
      expect(result).to eq(true)
      expect(@cd.quantity).to eq(5)
    end
    it "should not be able to sell more items than we have" do
      result = @cd.sell 6
      expect(result).to eq(false)
      expect(@cd.quantity).to eq(5)
    end
    it "should be able to sell items and update quantity" do
      result = @cd.sell 3
      expect(result).to eq(true)
      expect(@cd.quantity).to eq(2)
    end
    it "should be able to return items" do
      result = @cd.return 3
      expect(@cd.quantity).to eq(5) 
    end 
    it "should return a shipping cost" do
      @cd.weight = 10
      result = @cd.ship_price
      expect(result).to eq(12)
    end   
  end
end