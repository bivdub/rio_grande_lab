require_relative 'spec_helper'
require_relative '../lib/ClothingItem'

describe ClothingItem do

  before(:context) do
    @clothingitem = ClothingItem.new("Generic ClothingItem",1.99)
    @clothingitem2 = ClothingItem.new("Generic ClothingItem", 1.99, 10)
  end

  describe "Initialization" do
    it "is an instance of the ClothingItem class" do
      expect(@clothingitem).to be_instance_of(ClothingItem)
    end
    it "should have a parent class of item" do
      expect(@clothingitem.class.superclass).to eq(Item)
    end
    it "is assigned a name" do
      expect(@clothingitem.name).to eq("Generic ClothingItem")
    end
    it "is assigned a price" do
      expect(@clothingitem.price).to eq(1.99)
    end
    it "is assigned a weight" do
      expect(@clothingitem.weight).to eq(0)
    end
    it "is assigned a shipping price per oz" do
      expect(@clothingitem.ship_price_per_oz).to eq(1.2)
    end
    it "Should set the weight if a third paramater is passed" do
      expect(@clothingitem2.weight).to eq(10)
    end
  end

  describe "Accessors" do
    it "should be able to get quantity" do
      expect(@clothingitem.quantity).to eq(0)
    end
    it "should be able to get and set name" do
      @clothingitem.name="New Name"
      expect(@clothingitem.name).to eq("New Name")
    end   
    it "should be able to get and set price" do
      @clothingitem.price=44.99
      expect(@clothingitem.price).to eq(44.99)
    end   
    it "should be able to get and set description" do
      expect(@clothingitem.description).to eq("")
      @clothingitem.description="test"
      expect(@clothingitem.description).to eq("test")
    end  
    it "should be able to get and set weight" do
      expect(@clothingitem.weight).to eq(0)
      @clothingitem.weight = 10
      expect(@clothingitem.weight).to eq(10)
    end  
  end

  describe "Methods" do
    it "should be able to stock with amount AND size" do
      @clothingitem.stock 5, "small"
      expect(@clothingitem.quantity("small")).to eq(5)
    end
    it "should not create duplicate sizes" do
      @clothingitem.stock 0, "small"
      expect(@clothingitem.quantity("small")).to eq(5)
    end
    it "should not be able to sell more Clothingitems than we have" do
      result = @clothingitem.sell 6, "small"
      expect(result).to eq(false)
      expect(@clothingitem.quantity("small")).to eq(5)
    end
    it "should be able to sell Clothingitems and update quantity" do
      result = @clothingitem.sell 3, "small"
      expect(result).to eq(true)
      expect(@clothingitem.quantity).to eq(2)
    end   
    it "should be able to return Clothingitems" do
      @clothingitem.return 3, "small"
      expect(@clothingitem.quantity("small")).to eq(5) 
    end
    it "should return a shipping cost" do
      @clothingitem.weight = 10
      result = @clothingitem.ship_price
      expect(result).to eq(12)
    end
    it "should be be able to access total inventory or inventory by size" do
      @clothingitem.stock 5, "large"
      expect(@clothingitem.quantity).to eq(10)
      expect(@clothingitem.quantity("large")).to eq(5)
    end
    it "should be able to access sizes for an item" do
      expect(@clothingitem.sizes).to eq(["small", "large"])
    end
  end

end