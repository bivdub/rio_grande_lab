require_relative 'Item.rb'
class Cd < Item

  attr_accessor :tracks, :artist, :runtime

  def initialize name, price, tracks, artist, runtime, *weight
    super(name, price, weight[0])
    @tracks = tracks
    @artist = artist
    @runtime = runtime
  end

end