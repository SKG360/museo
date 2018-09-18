require './lib/photograph'
require './lib/artist'

class Curator
  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo_arg)
    photograph = Photograph.new(photo_arg)
    @photographs << photograph
  end

  def add_artist(artist)
    artist = Artist.new(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id 
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo.id == id
    end
  end

end
