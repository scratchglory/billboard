require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './environment'
require_relative './cli'

class Scraper #< Billboard::CLI  # Inheritence
    @@base_url = "https://www.billboard.com"
    
    def self.get_chart
        doc = Nokogiri::HTML(open(@@base_url + "/charts/hot-100"))   
        list_of_songs = doc.css("div.chart-list-item")

        list_of_songs.map do |song|     # iterating through each </div.chart-list-item> 
            song_hash = {}
            song_hash[:title] = song.css("div.chart-list-item__title").text.strip
            song_hash[:artist] = song.css("div.chart-list-item__artist").text.strip
            song_hash[:ranking] = song.css("div.chart-list-item__rank").text.strip
            song_hash[:url] = song.css("div.chart-list-item__artist a")[0] ? song.css("div.chart-list-item__artist a")[0].attributes["href"].value : "nil"
                # If index 0 has the attribute 'href' then execute, else 'nil'
            song_hash
        end # iterator do
    end
    
    # def get_artist_details0(url)
    #     doc = Nokogiri::HTML(open(@@base_url + url))
    #     # binding.pry
    #     artist_details = doc.css("div.artist-section.artist-section--chart-history")
    #     artist_details.map do |artist|
    #         # artist_array = [] 
    #         song_title = artist.css("div.artist-section--chart-history__title-list__title__text a.artist-section--chart-history__title-list__title__text--title").text.strip # Song title
    #         # artist_array << song_title
    #         # artist_array
    #         # artist_details
    #         song_title
    #         # binding.pry
    #     end # end of do
    # end # end of get_arttist_details

    def get_artist_details0(url)
        doc = Nokogiri::HTML(open(@@base_url + url))
        artist_details = doc.css("main#main")
        artist_hash = {}
        artist_details.map do |artist|
            artist_hash[:name] = artist.css(".artist-header__title").first.text.strip
            artist_hash[:songs] = artist.css("div.artist-section--chart-history__title-list__title__text a.artist-section--chart-history__title-list__title__text--title").text.strip
            artist_hash[:url] = url
            artist_hash
        end # end of do
        Artist.all << artist_hash
    

    # binding.pry
    #     updated_chart = Artist.all.detect {|info| info[:url] == url}
    #     # updated_chart.name = doc.css("main#main .artist-header__title").first.text.strip if artist_hash[:name]  # artist name 
    #     updated_chart[:songs]= doc.css("main#main div.artist-section--chart-history__title-list__title__text a.artist-section--chart-history__title-list__title__text--title").text.strip if artist_hash[:songs]
    # end

    end # end of get_artist_details0

    
end # end of class
