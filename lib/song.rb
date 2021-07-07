class Song
    attr_accessor :artist, :genre, :name

    @@all = []
   
    def initialize(name)
        @name = name
        @@all <<  self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        file_name_pieces = file_name.split(' - ')
        song = Song.new(file_name_pieces[1])
        song.artist_name = file_name_pieces[0]
        song.genre = file_name_pieces[2]
        song
    end

    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        self.artist = artist
    end
end