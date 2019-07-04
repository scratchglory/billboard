# To scrape/pull the url for the artist selected.
# Artist class
## instantiated with the artist's name and url
### create Song.artist == Artist.new()
#### check to not rescrape (selecting the same number again) => checking through .all

class Artist  # also considered Constance
    attr_accessor :name, :songs
    @@all =[]

     def initialize(name, songs = nil)
        @name = name
        @songs = songs
        save  # When a new objet is made, it will save itself
     end # initialize

    def self.all 
        @@all
    end # all

    def save
        @@all << self
    end # save

    def self.create(name, songs)
        new_artist = self.new(name, songs)
        new_artist.save
        new_artist
    end # create


    def self.find_by_name(name) # name is a string 
        # iterate through the @@all array (detect), returning the element of the array for which the following block returns true
        @@all.detect {|artist| artist.name == name}
    end # find_by_name

end # Class
 