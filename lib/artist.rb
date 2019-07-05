# To scrape/pull the url for the artist selected.
# Artist class
## instantiated with the artist's name and url
### create Song.artist == Artist.new()
#### check to not rescrape (selecting the same number again) => checking through .all

class Artist  # also considered Constance
    attr_accessor :name, :songs, :ranking, :url
    @@all =[]

     def initialize(name, ranking, songs, url)
        @name = name
        @ranking = ranking
        @songs = songs
        @url = url
     end # initialize

    def self.all 
        @@all
    end # all

    def save
        @@all << self
    end # save

    def self.create(name, ranking, songs, url)
        new_artist = self.new(name, ranking, songs, url)
        new_artist.save
        new_artist
    end # create


    def self.find_by_name(ranking) # name is a string 
        # iterate through the @@all array (detect), returning the element of the array for which the following block returns true
        @@all.detect {|artist| artist.name == name}
    end # find_by_name

end # Class
 