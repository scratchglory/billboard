class Song
    attr_accessor :title, :artist, :ranking
    @@all = [] # to store all of the songs created

    def initialize
        @title = title
        @artist = artist
        @ranking = ranking
        @@all
    end # end of initialize

    def self.all
        @@all
    end #self.all

    def self.save # creating the sogns with artist
        # @@all << self.
        # @@all
        # binding.pry
    end # create

#     def self.find_by_name(artist_input)
#         self.all.find {|artist| song_info.artist = artist_input}
#         binding.pry
#     end #find_by_name
end #Class