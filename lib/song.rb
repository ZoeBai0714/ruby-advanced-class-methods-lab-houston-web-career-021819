require 'pry'
class Song
  attr_accessor :name, :artist_name
     @@all = []
   def initialize(name = nil)
     @name = name
     @artist_name = artist_name
     @@all << self
   end
   
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = Song.new(name)
    song
  end
  
  def self.create_by_name(name)
    #song = self.create
    song = self.new_by_name(name)
    #song.name = name
    song
  end
  
  def self.find_by_name(name)
    result = @@all.select do |song|
       song.name == name
    end
    
    if result != []
      return result[0]
    else
      return nil
    end
  end
  
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  
  def self.alphabetical
    #binding.pry
    @@all.sort_by {|song| song.name} 
  end
  
  def
end
