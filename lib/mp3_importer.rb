class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{@path}/*.mp3"]
    @files.collect! do |filename|
      filename.gsub!("#{@path}/", '')
    end
  end

  def import
    # #files
    files.collect! do |filename|
      title = filename.split('-')[0].strip
      artist = filename.split('-')[1].strip.gsub('.mp3', '')
      Song.new_by_filename(title)
    end
  end
end
