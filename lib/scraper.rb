require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './environment'
# return an array of hashes

class Scraper
    @@base_url = "https://www.billboard.com"
    
    def self.get_chart
        doc = Nokogiri::HTML(open(@@base_url + "/charts/hot-100"))   
        list_of_songs = doc.css("div.chart-list-item")
        
        list_of_songs.map do |song|     # iterating through each </div> 
            song_hash = {}
            song_hash[:title] = song.css("div.chart-list-item__title").text.strip
            song_hash[:artist] = song.css("div.chart-list-item__artist").text.strip
            song_hash[:ranking] = song.css("div.chart-list-item__rank").text.strip
            song_hash[:url] = song.css("div.chart-list-item__artist a")[0] ? song.css("div.chart-list-item__artist a")[0].attributes["href"].value : "nil"
            song_hash
        end # iterator do
    end

    #  def self.get_artist_chart(artist_input)
    #     doc = Nokogiri::HTML(open(@@base_url + "/charts/hot-100"))   
    #     artist_history_chart = doc.css("div.chart-list-item__artist a")
    #     artist_history_chart.map do |info|
    #         artist_history_chart_hash = {}
    #         artist_history_chart_hash[:url] = "https://www.billboard.com" + song.css("div.chart-list-item__artist a")[0].attributes["href"].value   #https://www.billboard.com/music/(artist-name)
    #         artist_history_chart_hash
    #     end # end of do loop
        
    #     artist_url = Song.all.detect {|artist_name| artist_name.artist == artist_input}
    #     # binding.pry
    #  end # get_artist_chart


     def self.get_artist_chart(url)
        Song.url
     end

end #end of class
