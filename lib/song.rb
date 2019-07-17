# called upon CLI.list_of_songs

class Song 
    attr_accessor :title, :artist, :ranking
    @@all = [] # to store all of the songs created

    def initialize(title, artist, ranking)
        @title = title
        @artist = artist
        @ranking = ranking
    end # initialize

    def self.all
        @@all
    end # self.all

    def save # creating the songs with artist
        @@all << self        
    end # save

    def self.create(title, artist, ranking, url)
        new_artist = Artist.create(artist, url)
        new_song = self.new(title, new_artist, ranking)
        new_song.save
        new_song
    end # create

    def self.find_by_ranking(input) # class finder, always its responsiblity
        self.all.find {|song| song.ranking == input}
    end
    
end # Class

