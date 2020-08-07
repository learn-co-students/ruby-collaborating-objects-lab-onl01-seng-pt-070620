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
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end 
  
  def self.new_by_filename(file)
    artist, song = file.split(" - ")
    parsed_song = song.gsub(".mp3", "")
    
    new_song = self.new(parsed_song)
    new_song.name = parsed_song 
    new_song.artist_name = artist 
    new_song
    
  end
    

end 
#s = Song.new("99")
#s.artist = artist_1

# how to run the test for a single file 