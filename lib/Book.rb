require_relative 'Item.rb'
class Book < Item

  attr_accessor :pages, :author

    def initialize name, price, pages, author, *weight
        super(name,price, weight[0])
        @pages = pages
        @author = author
    end

end