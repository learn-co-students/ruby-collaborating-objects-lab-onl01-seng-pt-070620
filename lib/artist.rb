require "pry"

class Artist

    attr_accessor :name, :songs
  
    @@all = [] 
  
    def initialize(name)#artist_name
      @name = name
      @songs = [] 
      @@all << self
      self
    end
  
  
    def add_song(song)
      @songs << song
    end
  
    def self.find_or_create_by_name(name)
      if self.find(name)
        self.find(name)
        
      else
        self.create(name)
        
      end
      
    end
  
  
    def self.find(name)
      @@all.find  {|artist|
        artist.name == name}
      
    end
  
    def self.create(name)
      artist = self.new(name)

      artist
      
    end
  
  
  
    def save
      @@all << self
      
    end
  
    
    def print_songs()
      puts @songs.collect {|x| x.name}
    end

    def self.all
       @@all
    end
  
  end
  