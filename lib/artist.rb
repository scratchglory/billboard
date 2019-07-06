# To scrape/pull the url for the artist selected.
# Artist class
## instantiated with the artist's name and url
### create Song.artist == Artist.new()
#### check to not rescrape (selecting the same number again) => checking through .all

class Artist  # also considered Constance
    attr_accessor :name, :songs, :url # :ranking, :url
    @@all =[]

     def initialize(name, songs, url) # ranking, url)
        @name = name
        # @ranking = ranking
        @songs = songs
        @url = url
     end # initialize

    def self.all 
        @@all
    end # all

    def save
        @@all << self
    end # save

    def self.create(name, songs, url) # ranking, url)
        new_artist = self.new(name, songs, url) # ranking, url)
        new_artist.save
        new_artist
    end # create

    
    def self.find_by_ranking(input) # name is a string 
        # iterate through the @@all array (detect), returning the element of the array for which the following block returns true
        # @@all.detect {|info| info.ranking == input}
        puts "this is #{input}"
    end # find_by_name

end # Class
 

# #<Artist:0x0000000002f88138 @name="Billie Eilish", @songs="Bad Guy\n\nBury A Friend\n\nWhen The Party's Over\n\nWish You Were Gay\n\nXanny">

##<Artist:0x0000000003fc3b88 @name="Drake", @songs="Work\n\nOne Dance\n\nGod's Plan\n\nNice For What\n\nIn My Feelings"