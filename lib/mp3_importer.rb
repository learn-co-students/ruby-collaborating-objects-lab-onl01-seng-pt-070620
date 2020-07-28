
class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def import
    files.each do |filename|  #where did the "files" came from?
      Song.new_by_filename(filename)
    end
  end

  def files

    files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}  #have no idea wtf happened here
  end

end
