class Artist
  attr_accessor :name, :songs # establish the has many with song class

  @@all = []

  # accepts a name for the artist
  # initialize with #name
  def initialize(name)
    @name = name
    # the @songs attribute has many objects instead strings
    @songs = []  # establish the has many with song class
    save
  end

  # returns all existing Artist instances
  def self.all
    @@all
  end

  # keeps track of an artist\'s songs
  def add_song(song)
  # tell the song it belongs to its artist
  # artist= method is used on the song passed in as an argument
  # self refers to the artist instance in this Artist class
    song.artist = self
    @songs << song # this add an object which is song with all its attributes to @songs instead of adding strings
  end

  # lists all songs that belong to this artist
  def songs
    Song.all.select { |song| song.artist == self} # self represents Artist instance this method is called on
  end

  # always returns an Artist instance
  # finds or creates an artist by name maintaining uniqueness of objects by name property
  # Creates new instance of Artist if none exist

  def save
    @@all << self
  end

  def self.find_or_create_by_name(artist_name)
    found_artist = self.all.find { |artist| artist.name == artist_name}
      if found_artist
        found_artist
      else
        new_artist = Artist.new(artist_name)
        new_artist
      end
  end

  # lists all of the artist\'s songs
  def print_songs
    songs.each {|song| puts song.name}
  end

end
