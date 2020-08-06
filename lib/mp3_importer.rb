require 'pry'
class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  # loads all the mp3 files in the path directory
  # normalizes the filename to just the mp3 filename with no path
  def files

    Dir.glob("#{@path}/*.mp3").collect {|file| file.gsub("./spec/fixtures/mp3s/", "")}
  end

  # imports the files into the library by creating songs from a filename
  def import
    Dir.entries(@path).each {|song| Song.new_by_filename(song)}
  end

end
