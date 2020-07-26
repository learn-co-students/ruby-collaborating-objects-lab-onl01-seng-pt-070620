require 'pry'
class Artist
  attr_accessor :name, :artist
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song) # pass in a song object/instance. tell it this instance of the artist class OWNS it
    song.artist = self
  end

  def songs
    Song.all.find_all do |song| # .find doesn't work here because find returns the first value if true
      song if song.artist == self
    end
  end

  def self.find_or_create_by_name(artist)
    all.all? { |object| object.name != artist } ? Artist.new(artist) : all.find { |object| object.name == artist } # this needs better understanding
  end

  def print_songs
    Song.all.find_all do |song|
      puts song.name if song.artist == self
    end
  end
end
