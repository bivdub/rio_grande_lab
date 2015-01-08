# You are on your own... good luck.
require_relative 'Item.rb'
class Digitalitem < Item

    attr_accessor :download_size

    def initialize name, price, *size
        super(name,price)
        @quantity = 1
        @weight = -1
        @download_size = size[0] || 0
    end

    def sell amount
      true
    end

    def stock amount
      false
    end

    def return amount
      true
    end

    def ship_price
      if @weight == -1
        return false
      end
    end

end