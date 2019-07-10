# called upon CLI.list_of_songs

class Song 
    attr_accessor :title, :artist, :ranking, :url
    @@all = [] # to store all of the songs created

    def initialize(title, artist, ranking, url)
        @title = title
        @artist = artist
        @ranking = ranking
        @url = url
        @@all
    end # end of initialize

    def self.all
        @@all
    end #self.all

    def save # creating the songs with artist
        self.class.all << self        
    end # save

    def self.create(title, artist, ranking, url)
        new_song = self.new(title, artist, ranking, url)
        new_song.save
        new_song
    end # create

    # def artist=(name)  # Artist has name, song, url
    #     artist = Artist.new(name)

    # end # end of artist=

    def self.has_songs(artist_name)
        # binding.pry
        Artist.all.find {|artist| artist.name == artist_name}
    end # end of has_songs
      

end #Class

