require_relative 'Digitalitem.rb'
class Song < Digitalitem

  attr_accessor :tracks, :artist, :runtime

  def initialize name, price, artist, runtime, *size
    super(name, price, size[0])
    @artist = artist
    @runtime = runtime
  end

end