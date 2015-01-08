# You are on your own... good luck.
require_relative 'Item.rb'
class ClothingItem < Item

    def initialize name, price, *weight
        super(name,price, weight[0])
        @quantity = {}
    end

   def sell amount, size
        if @quantity[size] >= amount
            @quantity[size] -= amount
            true
        else
            false
        end
    end

    def stock amount, size
      if @quantity[size]
        @quantity[size] += amount
      else 
        @quantity[size] = amount
      end
    end

    alias_method :return, :stock

    def sizes
      @quantity.keys
    end

    def quantity *size
      if size[0]
        @quantity[size[0]]
      else 
        total = 0
        @quantity.each do |key, value|
          total += value
        end
        return total
      end
    end

end