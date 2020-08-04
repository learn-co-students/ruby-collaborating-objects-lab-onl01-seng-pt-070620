require 'pry'
class Artist

  attr_accessor :name

  @@all = []
  @@song_count = 0

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    #binding.pry
    @songs << song
    @@song_count += 1
  end

  def songs
    @songs
  end

  def self.find_or_create_by_name(name)
    #self.find(name) ||= self.create(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end

  def self.find(name)
    @@all.find do |artist|
      artist.name == name
    end
  end

  def self.create(name)
    artist = self.new(name)
    #@@all << artist
    artist
  end

  def print_songs
    #binding.pry
    puts self.songs.collect {|song| song.name}
  end

end
