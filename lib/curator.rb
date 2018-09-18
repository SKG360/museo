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

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end

  def calculate_artists_with_multiple_photos
    @photographs.reduce(Hash.new(0)) do |hash, artist|
      hash[artist.artist_id] += 1
      hash
    end
  end

  def finds_artists_with_multi_photos_quantity
    cawmp_2 = calculate_artists_with_multiple_photos.values
    gogo = cawmp_2.map.with_index do |photo_num, idx|
      if photo_num > 1
        [photo_num, idx]
      end
    end.compact.flatten
  end

  def finds_artist_id_by_number_of_duplicates
    cawmp_1 = calculate_artists_with_multiple_photos.keys
    fawmpq = finds_artists_with_multi_photos_quantity
    cawmp_1.map.with_index do |artist_id, idx|
      if idx == fawmpq[1]
        artist_id
      end
    end.compact
  end

  def artists_with_multiple_photographs
    faibyod = finds_artist_id_by_number_of_duplicates
    faibyod.map do |artist_id|
      find_artist_by_id(artist_id)
    end
  end

end
