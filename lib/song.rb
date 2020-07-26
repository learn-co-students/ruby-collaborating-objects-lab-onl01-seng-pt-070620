class Song
  attr_accessor :name, :artist, :title
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(title)
    newsong = Song.new(title.split('-')[1].strip)

    # newsong.artist.name = title.split('-')[0].strip
    newsong.artist = Artist.find_or_create_by_name(title.split('-')[0].strip)
    newsong

    # newartist = Artist.find_or_create_by_name(artist)
    # newartist.add_song(title)
  end

  def artist_name=(artist)
    artist = Artist.find_or_create_by_name(artist)
    artist.add_song(self)
  end
end
