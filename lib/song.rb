require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song_by_name = Song.new
    song_by_name.name = name
    song_by_name
  end

  def self.create_by_name(name)
    song_by_name = Song.new
    song_by_name.name = name
    song_by_name.save
    song_by_name
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(file_name)
    file_name_split = file_name.chomp(".mp3").split(" - ")
    new_song = Song.new
    new_song.name = file_name_split[1]
    new_song.artist_name = file_name_split[0]
    new_song
  end

  def self.create_from_filename(file_name)
    file_name_split = file_name.chomp(".mp3").split(" - ")
    new_song = Song.new
    new_song.name = file_name_split[1]
    new_song.artist_name = file_name_split[0]
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
