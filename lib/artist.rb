class Artist
attr_accessor :name
@@all = []

def initialize(name)
  @name = name
  @@all << self
end

  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def self.find_or_create_by_name(artist)
    @@all.detect {|artist| artist == artist} ||artist = self.new(artist)
  end
  
    def print_songs
      songs.each do |song|
     puts song.name
    end
  end

end