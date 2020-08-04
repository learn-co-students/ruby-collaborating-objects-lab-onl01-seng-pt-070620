class Artist 
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self
  end
  
  # def name=(newName)
  #   @name = newName
  # end
  
  def self.all 
    @@all
  end
  
  def add_song(song)
    song.artist = self
    
  end
  
  def songs 
    Song.all.select {|song| song.artist == self }
  end
  
  def self.find_or_create_by_name(name_string)
    found = false
    @@all.each do|artist|
      if artist.name == name_string
        found = true
        return artist 
        break
      end
    end
    if found == false
      new_artist = Artist.new(name_string)
     return new_artist
   end
  end
    
   def print_songs
    Song.all.each do |song|
      puts song.name if song.artist == self
    end
  end
  
  
end