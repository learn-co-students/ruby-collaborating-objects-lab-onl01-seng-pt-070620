require 'pry'
class MP3Importer
  attr_accessor :path
  @@all = []
  
  def initialize(path)
    @path = path
    @@all << self
  end
  
  def import
    @@all.each {|filename| Song.new_by_filename(filename)}
  end
  
  def files 
    stored_files = []
    a_dir = Dir.open self.path
    a_dir.each do |file|
      if file.end_with?("mp3")
        stored_files << file
      end
    end
    stored_files
  end
  
  def self.all 
    @@all
  end
end