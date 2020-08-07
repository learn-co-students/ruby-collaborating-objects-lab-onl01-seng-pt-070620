class Artist 
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name=name 
    @@all << self 
    @songs = []
  end 
  def self.all 
    @@all 
  end 
   
  def add_song(song) #s = Song.new("hotline_bling")
  #drake = Artist.new("drake")
  #drake.add_song("kiki")
    @songs << song
    song.artist= self
  end 
  def self.find_by_name(name)
    @@all.find{|artist| artist.name == name}
  end 
  def self.create_by_name(name)
    artist = self.new(name)
    artist.name = name 
    #@@all << artist 
    artist
  end 
   
 
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ||self.create_by_name(name)
     
      #my create by method returns the artist for me, both find_by_name and create_by_name are custom class methods, a contructor and a finder and we create them first and then use them to make a new method with both of their functionalities 
  end 
  def print_songs 
    puts @songs.collect {|x| x.name}
    #doesnt self have a property of songs?????
  end 
end 
    