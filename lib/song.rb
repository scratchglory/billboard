# called upon CLI.list_of_songs

class Song 
    attr_accessor :title, :artist, :ranking
    @@all = [] # to store all of the songs created

    def initialize(title, artist, ranking)
        @title = title
        @artist = artist
        @ranking = ranking
    end # end of initialize

    def self.all
        @@all
    end #self.all

    def save # creating the songs with artist
        self.class.all << self        
    end # save

    def self.create(title, artist, ranking, url)
        new_artist = Artist.create(artist, url)
        new_song = self.new(title, new_artist, ranking)
        new_song.save
        new_song
    end # create


    # def self.find_artist_by_name(artist_name)
    #     artist_name = Song.
    #     Artist.all.find {|artist| artist.name == artist_name}
    # end # end of has_songs

end #Class

