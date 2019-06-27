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

    def self.create # creating the sogns with artist
        html = Scraper.get_chart
        list_of_songs = html.css("div.chart-list-item")

        list_of_songs.each do |song|     # iterating through each </div> 
            song_info = self.new        # #<Song:0x0000000003e22478 @artist=nil, @ranking=nil, @song_title=nil>
            song_info.title = song.css("div.chart-list-item__title").text.strip
            song_info.artist = song.css("div.chart-list-item__artist").text.strip
            song_info.ranking = song.css("div.chart-list-item__rank").text.strip
            @@all << song_info

            puts "#{song_info.ranking}. #{song_info.title} - #{song_info.artist}"  
        end # iterator do
        # @@all
        # binding.pry
    end # create

  

    # def self.find_by_name(artist_input)
    #     self.all.find {|} 

    # end #find_by_name
end # end of class

