require_relative 'ClothingItem.rb'
class Pants < ClothingItem

    def initialize name, price, *weight
        super(name,price, weight[0])
    end

end