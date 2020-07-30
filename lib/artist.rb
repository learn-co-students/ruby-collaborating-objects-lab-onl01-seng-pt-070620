require 'pry'
class Artist
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
    
    def initialize(name)
      @name = name
      @songs = []
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def songs
      Song.all.select {|song| song.artist == self} 
    end
    
    def add_song(song)
      @songs << song
      song.artist = self
    end
    
    def songs
      Song.all.select do |song|
        song.artist == self
      end
    end
    
    def self.find_or_create_by_name(name)
      if self.all.find {|artist| artist.name == name}
        self.all.find {|artist| artist.name == name}
      else
        new_artist = Artist.new(name)
        new_artist
      end
    end

    def print_songs
      @songs.each {|song| puts song.name}
    end

end



