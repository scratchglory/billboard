require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './environment'
require_relative './cli'

class Scraper
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
            Song.all << song_hash
        end # iterator do 
    end # end of Scraper

    def get_artist_details(url)
        doc = Nokogiri::HTML(open(@@base_url + url,'User-Agent' => 'ruby'))
        artist_details = doc.css("main#main")
        artist_hash = {}
        artist_details.map do |artist|
            artist_hash[:name] = artist.css(".artist-header__title").first.text.strip
            artist_hash[:songs] = artist.css("div.artist-section--chart-history__title-list__title__text a.artist-section--chart-history__title-list__title__text--title").text.strip
            artist_hash[:url] = url
            Artist.all << artist_hash
        end # end of do
    end # end of get_artist_details0
end # end of class
