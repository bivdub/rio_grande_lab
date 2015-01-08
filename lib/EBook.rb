# You are on your own... good luck.
require_relative 'Digitalitem.rb'
class Ebook < Digitalitem

  attr_accessor :pages, :author

    def initialize name, price, pages, author, *size
        super(name,price, size[0])
        @pages = pages
        @author = author
    end

end