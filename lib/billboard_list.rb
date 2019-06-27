class Song
    attr_accessor :song_title, :artist, :ranking
    @@all = [] # to store all of the songs created

    def initialize
        @song_title = song_title
        @artist = artist
        @ranking = ranking
    end # end of initialize

    def self.allocate
        @@all
    end #self.all

    def self.create # creating the sogns with artist
        Scraper.get_chart
        binding.pry
    end



    

end # end of class