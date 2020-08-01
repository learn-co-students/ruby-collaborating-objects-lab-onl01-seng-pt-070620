class Artist
  attr_accessor :name, :songs
  
  @@all = []

  def initialize(name)
    @name = name
    @songs = [] 
    save
  end
  
  def add_song(song)
   self.songs << song
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find_or_create_by_name(name)
    !self.find(name) ? self.create(name) : self.find(name)
  end
  
  def self.find(name)
    self.all.find do |artist|
      artist.name == name
    end
  end
  
  def self.create(name)
    artist = self.new(name)
    artist
  end
  
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
  
end