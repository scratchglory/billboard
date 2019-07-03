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
    
    def self.get_artist_details#(artist_obj) # scraping second page
        # puts "this is being scraped"
        
        # scrape arist_obj.url
        # update artist_obj based on return from scrape
        # return the updated artist_obj
        doc = Nokogiri::HTML(open(@@base_url + "/music/drake")) # the aritst page url. #{Song.url}
        artist_details = doc.css("div.artist-section.artist-section--chart-history")
        artist_details.map do |artist|
            artist_array = [] 
            song_title = artist.css("div.artist-section--chart-history__title-list__title__text a.artist-section--chart-history__title-list__title__text--title").text.strip # Song title
            artist_array << song_title
            binding.pry
        end
    end

end #end of class

