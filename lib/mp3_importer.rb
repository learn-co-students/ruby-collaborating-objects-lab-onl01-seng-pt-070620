class MP3Importer

  attr_accessor :path, :title

  test_music_path = Dir["./spec/fixtures/mp3s"]

  def initialize(test_music_path)
    @path = test_music_path
  end

  # loads all the mp3 files in the path directory
  # normalizes the filename to just the mp3 filename with no path
  def files(filename)
    song = self.new
    song.title = filename.split(" - ")[1]
    song
  end

  # imports the files into the library by creating songs from a filename
  def import(list_of_filenames)
    list_of_filenames.each {|filename| Song.new_by_filename(filename)}
  end

end
