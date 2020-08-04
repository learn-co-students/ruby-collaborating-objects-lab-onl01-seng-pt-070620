class MP3Importer
  attr_accessor :path
  def initialize (path)
    @path=path
  end
  def files
     @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
   # @files ||= Dir.glob("#{path}/.mp3").collect { |f| f.gsub("#{path}/", "")}
  end

  def import
    files.each {|song| Song.new_by_filename(song)}
  end
end