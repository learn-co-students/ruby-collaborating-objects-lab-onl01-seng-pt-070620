require 'pry'

class Artist 
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    save
  end
  
  def save 
    @@all << self 
  end
    
  def self.all 
    @@all
  end 

  def add_song(song)
    song.artist = self
  end
  
  def songs 
    Song.all.select {|song| song.artist == self}
  end
  
  def self.find_or_create_by_name(name)
      found_artist = @@all.find {|artist| artist.name == name}
     if found_artist 
       found_artist
    else
       new_artist = Artist.new(name) 
    end
  end
  
  def print_songs
      self.songs.each do |song| 
        puts "#{song.name}"
    end
  end
  
end