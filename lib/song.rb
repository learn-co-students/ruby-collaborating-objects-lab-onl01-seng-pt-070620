require 'pry'
class Song 
  attr_accessor :name, :artist
  @@all = []
  def initialize(name)
    @name= name
    @@all << self
  end 
  def self.all 
    @@all 
  end
  def save 
    self.class.all << self
  end
  def self.create
    song = self.new 
    song.save
    song
  end 
  def self.new_by_name(name)
    song = Song.new
    song.name = name 
    song 
  end 
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    song.save
    song
  end 
  def self.find_by_name(name)
    all.find {|n| n.name == name}
  end 
  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end 
  def artist_name 
    
  end 
  
  def self.new_from_filename(filename)
    artist, song = filename.split(" - ")
    parsed_song = song
    
    new_song = self.new
    new_song.name = parsed_song 
    new_song.artist = artist 
    new_song
    binding.pry
  end
    
  
  def artist_name 
  end 
  
end 
#s = Song.new("99")
#s.artist = artist_1

# how to run the test for a single file 