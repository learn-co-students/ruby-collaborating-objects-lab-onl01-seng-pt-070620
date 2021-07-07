class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name)
    @name = name
    @@all << self 
  end 
 
  def self.all
    @@all
  end 
 
  def self.new_by_filename(file)
    file_info = file.chomp(".mp3").split(" - ")
    song = Song.new(file_info[1])
    song.artist_name = file_info[0]
    song
 end 
 
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end 
end 