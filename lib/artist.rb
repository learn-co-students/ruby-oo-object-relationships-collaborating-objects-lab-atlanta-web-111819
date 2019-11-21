require 'pry'
class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all  
    end

    def songs
        Song.all.select do |song|
            if song.artist
                song.artist == self
            else
                false
            end
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
        artist_exists = Artist.all.find {|artist| artist.name == artist_name}
        if artist_exists
            artist_exists
        else
            Artist.new(artist_name)
        end
    end

    def print_songs
        songs = self.songs
        songs.each {|song| puts song.name}
    end
end
