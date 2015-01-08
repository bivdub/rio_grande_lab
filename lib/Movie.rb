# You are on your own... good luck.
require_relative 'Digitalitem.rb'
class Movie < Digitalitem

  attr_accessor :director, :producer, :runtime

  def initialize name, price, director, producer, runtime, *size
    super(name, price, size[0])
    @director = director
    @producer = producer
    @runtime = runtime
  end

end