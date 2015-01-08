require_relative 'spec_helper'
require_relative '../lib/Pants'

describe Pants do

  before(:context) do
    @pants = Pants.new("Generic Pants",1.99)
    @pants2 = Pants.new("Generic Pants", 1.99, 10)
  end

  describe "Initialization" do
    it "is an instance of the Pants class" do
      expect(@pants).to be_instance_of(Pants)
    end
    it "should have a parent class of item" do
      expect(@pants.class.superclass).to eq(ClothingItem)
    end
    it "is assigned a name" do
      expect(@pants.name).to eq("Generic Pants")
    end
    it "is assigned a price" do
      expect(@pants.price).to eq(1.99)
    end
    it "is assigned a weight" do
      expect(@pants.weight).to eq(0)
    end
    it "is assigned a shipping price per oz" do
      expect(@pants.ship_price_per_oz).to eq(1.2)
    end
    it "Should set the weight if a third paramater is passed" do
      expect(@pants2.weight).to eq(10)
    end
  end

  describe "Accessors" do
    it "should be able to get quantity" do
      expect(@pants.quantity).to eq(0)
    end
    it "should be able to get and set name" do
      @pants.name="New Name"
      expect(@pants.name).to eq("New Name")
    end   
    it "should be able to get and set price" do
      @pants.price=44.99
      expect(@pants.price).to eq(44.99)
    end   
    it "should be able to get and set description" do
      expect(@pants.description).to eq("")
      @pants.description="test"
      expect(@pants.description).to eq("test")
    end  
    it "should be able to get and set weight" do
      expect(@pants.weight).to eq(0)
      @pants.weight = 10
      expect(@pants.weight).to eq(10)
    end  
  end

  describe "Methods" do
    it "should be able to stock with amount AND size" do
      @pants.stock 5, "small"
      expect(@pants.quantity("small")).to eq(5)
    end
    it "should not create duplicate sizes" do
      @pants.stock 0, "small"
      expect(@pants.quantity("small")).to eq(5)
    end
    it "should not be able to sell more Pantss than we have" do
      result = @pants.sell 6, "small"
      expect(result).to eq(false)
      expect(@pants.quantity("small")).to eq(5)
    end
    it "should be able to sell Pantss and update quantity" do
      result = @pants.sell 3, "small"
      expect(result).to eq(true)
      expect(@pants.quantity).to eq(2)
    end   
    it "should be able to return Pantss" do
      @pants.return 3, "small"
      expect(@pants.quantity("small")).to eq(5) 
    end
    it "should return a shipping cost" do
      @pants.weight = 10
      result = @pants.ship_price
      expect(result).to eq(12)
    end
    it "should be be able to access total inventory or inventory by size" do
      @pants.stock 5, "large"
      expect(@pants.quantity).to eq(10)
      expect(@pants.quantity("large")).to eq(5)
    end
    it "should be able to access sizes for an item" do
      expect(@pants.sizes).to eq(["small", "large"])
    end
  end

end