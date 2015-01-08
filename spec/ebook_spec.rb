# You are on your own... good luck.

require_relative 'spec_helper'
require_relative '../lib/Ebook.rb'

describe Ebook do

  before(:context) do
    @ebook = Ebook.new("Generic Item",1.99, 450, "Joyce")
    @ebook2 = Ebook.new("Generic Item",1.99, 450, "Joyce", 10)
  end

  describe "Initialization" do
    it "is an instance of the Ebook class" do
      expect(@ebook).to be_instance_of(Ebook)
    end
    it "should have a parent class of Digitalitem" do
      expect(@ebook.class.superclass).to eq(Digitalitem)
    end
    it "is assigned a name" do
      expect(@ebook.name).to eq("Generic Item")
    end
    it "is assigned a price" do
      expect(@ebook.price).to eq(1.99)
    end
    it "Should have a number of pages" do
      expect(@ebook.pages).to eq(450)
    end
    it "should have an author" do
      expect(@ebook.author).to eq("Joyce")
    end
    it "should have an integer for page numbers" do
      expect(@ebook.pages.is_a? Integer).to eq(true)
    end
    it "is assigned a weight of -1" do
      expect(@ebook.weight).to eq(-1)
    end
    it "should set Download size if passed in" do
      expect(@ebook2.download_size).to eq(10)
    end
    it "should have a download size of 0 if not specified" do
      expect(@ebook.download_size).to eql(0)
    end
  end

  describe "Accessors" do
    it "should be able to get quantity" do
      expect(@ebook.quantity).to eq(1)
    end
    it "should be able to get and set name" do
      @ebook.name="New Name"
      expect(@ebook.name).to eq("New Name")
    end   
    it "should be able to get and set price" do
      @ebook.price=44.99
      expect(@ebook.price).to eq(44.99)
    end   
    it "should be able to get and set description" do
      expect(@ebook.description).to eq("")
      @ebook.description="test"
      expect(@ebook.description).to eq("test")
    end  
    it "should be able to get and change the number of pages" do
      expect(@ebook.pages).to eq(450)
      @ebook.pages = 10
      expect(@ebook.pages).to eq(10)
    end
    it "should be able to get and change the author" do
      expect(@ebook.author).to eq("Joyce")
      @ebook.author = "James"
      expect(@ebook.author).to eq("James")
    end  
  end

  describe "Methods" do
    it "SHOULDN'T be able to stock" do
      result = @ebook.stock 5
      expect(result).to eq(false)
      expect(@ebook.quantity).to eq(1)
    end
    it "should be able to sell any quantity" do
      result = @ebook.sell 6
      expect(result).to eq(true)
      expect(@ebook.quantity).to eq(1)
    end    
    it "should accept returns and leave inventory at 1" do
      @ebook.return 5
      expect(@ebook.quantity).to eq(1)
    end
    it "should return false when ship_price is called" do
      expect(@ebook.ship_price).to eq(false)
    end
  end

end