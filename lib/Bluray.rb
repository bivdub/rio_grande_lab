require_relative 'Item.rb'
class Bluray < Item

  attr_accessor :director, :producer, :runtime

  def initialize name, price, director, producer, runtime, *weight
    super(name, price, weight[0])
    @director = director
    @producer = producer
    @runtime = runtime
  end

end