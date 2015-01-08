require_relative 'spec_helper'
require_relative '../lib/Book'

describe Book do

  before(:context) do
    @book = Book.new("Finnegans Wake", 15.58, 450, "Joyce")
    @book2 = Book.new("Finnegans Wake", 15.58, 450, "Joyce", 10)
  end

  #check inilization
  describe "initialization" do
    it "should have the book class" do
      expect(@book).to be_instance_of(Book)
    end
    it "should have a parent class of item" do
      expect(@book.class.superclass).to eq(Item)
    end
    it "Should have a number of pages" do
      expect(@book.pages).to eq(450)
    end
    it "should have an author" do
      expect(@book.author).to eq("Joyce")
    end
    it "should have a title" do
      expect(@book.name).to eq("Finnegans Wake")
    end
    it "should have a price" do
      expect(@book.price).to eq(15.58)
    end
    it "should have an integer for page numbers" do
      expect(@book.pages.is_a? Integer).to eq(true)
    end
    it "is assigned a weight" do
      expect(@book.weight).to eq(0)
    end
    it "is assigned a shipping price per oz" do
      expect(@book.ship_price_per_oz).to eq(1.2)
    end
    it "should set the weight if passed in" do
      expect(@book2.weight).to eq(10)
    end
  end

  describe "accessors" do
    it "should be able to get and change the number of pages" do
      expect(@book.pages).to eq(450)
      @book.pages = 10
      expect(@book.pages).to eq(10)
    end
    it "should be able to get and change the author" do
      expect(@book.author).to eq("Joyce")
      @book.author = "James"
      expect(@book.author).to eq("James")
    end
    it "should be able to get quantity" do
      expect(@book.quantity).to eq(0)
    end
    it "should be able to get and set price" do
      @book.price=44.99
      expect(@book.price).to eq(44.99)
    end 
    it "should be able to get and set name" do
      @book.name="New Name"
      expect(@book.name).to eq("New Name")
    end 
    it "should be able to get and set description" do
      expect(@book.description).to eq("")
      @book.description="test"
      expect(@book.description).to eq("test")
    end    
    it "should be able to get and set weight" do
      expect(@book.weight).to eq(0)
      @book.weight = 10
      expect(@book.weight).to eq(10)
    end 
  end

  describe "Methods" do
    it "should be able to stock" do
      result = @book.stock 5
      expect(result).to eq(true)
      expect(@book.quantity).to eq(5)
    end
    it "should not be able to sell more items than we have" do
      result = @book.sell 6
      expect(result).to eq(false)
      expect(@book.quantity).to eq(5)
    end
    it "should be able to sell items and update quantity" do
      result = @book.sell 3
      expect(result).to eq(true)
      expect(@book.quantity).to eq(2)
    end    
    it "should be able to return items" do
      result = @book.return 3
      expect(@book.quantity).to eq(5) 
    end
    it "should return a shipping cost" do
      @book.weight = 10
      result = @book.ship_price
      expect(result).to eq(12)
    end
  end

end
