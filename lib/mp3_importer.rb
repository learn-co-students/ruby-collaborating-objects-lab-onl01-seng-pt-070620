class MP3Importer
 
  attr_reader :path 
 
  def initialize(path)
   @path = path
  end
  
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|n| n.gsub("#{path}/","")}
  end
  
  def import
  files.each {|n| Song.new_by_filename(n)}
  end
  
  
end