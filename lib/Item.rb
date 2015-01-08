class Item
    attr_reader :quantity
    attr_accessor :name, :price, :description, :weight

    @@ship_price_per_oz = 1.2

    def initialize name, price, *weight
        @name = name
        @price = price
        @quantity = 0
        @description = ""
        @weight = weight[0] || 0
    end

    def sell amount
        if @quantity >= amount
            @quantity -= amount
            true
        else
            false
        end
    end

    def stock amount
        @quantity += amount
        true
    end

    alias_method :return, :stock

    def ship_price 
        @weight * @@ship_price_per_oz 
    end

    def ship_price_per_oz
        @@ship_price_per_oz
    end

end