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
        @@all << self        
    end # create

    def self.create(title, artist, ranking, url)
        new_song = self.new(title, artist, ranking, url)
        new_song.save
        new_song
    end

#     def self.find_by_name(artist_input)
#         self.all.find {|artist| song_info.artist = artist_input}
#         binding.pry
#     end #find_by_name
end #Class

# binding.pry
# 

