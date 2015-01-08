# You are on your own... good luck.

require_relative 'spec_helper'
require_relative '../lib/Song'

describe Song do

  before(:context) do
    @song = Song.new("Generic Item",1.99, "artist", "5")
    @song2 = Song.new("Generic Item",1.99, "artist", "5", 10)
  end

  describe "Initialization" do
    it "is an instance of the Item class" do
      expect(@song).to be_instance_of(Song)
    end
    it "should have a parent class of item" do
      expect(@song.class.superclass).to eq(Digitalitem)
    end
    it "is assigned a name" do
      expect(@song.name).to eq("Generic Item")
    end
    it "is assigned a price" do
      expect(@song.price).to eq(1.99)
    end
    it "should have an artist" do
      expect(@song.artist).to eq("artist")
    end
    it "should have a run time" do 
      expect(@song.runtime).to eq("5")
    end
    it "is assigned a weight of -1" do
      expect(@song.weight).to eq(-1)
    end
    it "should set Download size if passed in" do
      expect(@song2.download_size).to eq(10)
    end
    it "should have a download size of 0 if not specified" do
      expect(@song.download_size).to eql(0)
    end
  end

  describe "Accessors" do
    it "should be able to get quantity" do
      expect(@song.quantity).to eq(1)
    end
    it "should be able to get and set name" do
      @song.name="New Name"
      expect(@song.name).to eq("New Name")
    end   
    it "should be able to get and set price" do
      @song.price=44.99
      expect(@song.price).to eq(44.99)
    end   
    it "should be able to get and set description" do
      expect(@song.description).to eq("")
      @song.description="test"
      expect(@song.description).to eq("test")
    end
    it "should be able to get and set artist" do
      expect(@song.artist).to eq("artist")
      @song.artist = "Run DMC"
      expect(@song.artist).to eq("Run DMC")
    end
    it "should be able to get and set run time" do 
      expect(@song.runtime).to eq("5")
      @song.runtime = "10:00"
      expect(@song.runtime).to eq("10:00")
    end    
  end

  describe "Methods" do
    it "SHOULDN'T be able to stock" do
      result = @song.stock 5
      expect(result).to eq(false)
      expect(@song.quantity).to eq(1)
    end
    it "should be able to sell any quantity" do
      result = @song.sell 6
      expect(result).to eq(true)
      expect(@song.quantity).to eq(1)
    end    
    it "should accept returns and leave inventory at 1" do
      @song.return 5
      expect(@song.quantity).to eq(1)
    end
    it "should return false when ship_price is called" do
      expect(@song.ship_price).to eq(false)
    end
  end

end