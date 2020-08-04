require 'pry'
class Artist
  attr_accessor :name
  
  @@all=[]
  def initialize (name)
    @name=name
    @@all << self
  end
  def self.all
    @@all
  end
  def add_song (song)
    song.artist= self
  end
  def songs 
   Song.all.select {|song| song.artist==self}
  end
  
  def self.find_or_create_by_name (name)
  #self.all.find {|artist| artist.name == name} || self.create(name)
  # def self.create (name)
  #   new_artist=Artist.new(name)
  #   new_artist
  # end
   if self.all.find {|artist| artist.name == name}
     self.all.find {|artist| artist.name == name}
   else 
     new_artist=self.new (name)
   end
    end
    def print_songs
      self.songs.each do |song|
        puts song.name
      end
  end
end