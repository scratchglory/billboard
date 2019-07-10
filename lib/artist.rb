# called upon for use in CLI.artist_select

class Artist  # also considered Constance
    attr_accessor :name, :songs, :url
    @@all =[]

     def initialize(name, songs, url)
        @name = name
        @songs = songs
        @url = url
     end # initialize

    def self.all 
        @@all
    end # all

    def save
        self.class.all << self
    end # save

    def self.create(name, songs, url)
        new_artist = self.new(name, songs, url)
        new_artist.save
        new_artist
    end # create


end # Class
 