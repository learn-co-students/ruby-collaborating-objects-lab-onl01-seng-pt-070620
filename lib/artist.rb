class Artist 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    @songs << song
  end
  
  def songs
    @songs 
  end
  
  def self.find_or_create_by_name(name)
    existing_artist = self.all.find {|artist| artist.name = name}
      if existing_artist
        existing_artist
      else
        new_artist = Artist.new(name)
        new_artist
    end
  end
  
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
  
end