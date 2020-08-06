class Artist 
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def  initialize(name)
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
  
  def songs
    Song.all.select{|song| song.artist == self}
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end
  
  def self.find_or_create_by_name(name)
  found_artist = @@all.find{|artist| artist.name == name}
  
    if found_artist 
      found_artist 
    else 
	    Artist.new(name)
    end
  end
  
  
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
  end 