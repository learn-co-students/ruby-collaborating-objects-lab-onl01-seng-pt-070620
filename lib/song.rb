require 'pry'
class Song 
  
  @@all = []
  attr_accessor :name, :artist 
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all 
    @@all 
  end

  def self.new_by_filename(file_name)
    string_array = file_name.split(" - ")
    new_genre = string_array[2].delete_suffix('.mp3')
    new_name = string_array[1]
    new_artist = string_array[0]
    
    new_song = Song.new(new_name)
    
    new_artist_obj = Artist.find_or_create_by_name(new_artist)
    new_song.artist = new_artist_obj
    new_song
    #binding.pry
  end
  
  def artist_name=(artist_name_string)
     new_artist_obj = Artist.find_or_create_by_name(artist_name_string)
     self.artist = new_artist_obj
  end
  
end 