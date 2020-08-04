require 'pry'
class MP3Importer
  
  attr_accessor :file_path
  
  
  def initialize(file_path)
    @file_path = file_path
  end
  
  
  def files
    Dir["#{@file_path}/**.mp3"].collect{ |file| file[21..-1]}
  end
  
  def import
    x = files
    x.each { |file| Song.new_by_filename(file)}
    
  end
  
    
  def path
    @file_path
  end 
  
  
  
  
  
end