class Song 
  attr_accessor :artist, :name, :artist_name, :file
  @@all = []
  
  def initialize(name)
    @artist = artist
    @name = name
    @@all << self
  end
  
  def self.new_by_filename(filename)
    @file = filename.split(" - ")[1]
    @artist = Artist.new(filename.split(" - ")[0])
    song = Song.new(@file)
    @artist.songs << song
    song.artist = @artist
    return song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
  
  def self.all 
    @@all
  end
  
  
end