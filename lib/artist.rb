require 'pry'

class Artist

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all

    @@all
  end



  def add_song(song)
    #
    self.songs << song
    song.artist = self
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end

  end

  def self.find_or_create_by_name(name)
    #binding.pry
    if Artist.all.detect {|artist| artist.name == name}
      Artist.all.detect {|artist| artist.name == name}
    else
      Artist.new(name)
    end
  end

    def print_songs
      self.songs.each do |song|
        puts song.name
      end
    end





end
