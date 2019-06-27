require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './environment'

class Scraper
    @@base_url = "https://www.billboard.com"

    def self.get_chart
      
        doc = Nokogiri.HTML(open(@@base_url + "/charts/hot-100"))   
    #     list_of_songs = doc.css("div.chart-list-item")

    # list_of_songs.each do |song|     # iterating through each </div> 
    #         title = song.css("div.chart-list-item__title").text.strip
    #         artist = song.css("div.chart-list-item__artist").text.strip
    #         ranking = song.css("div.chart-list-item__rank").text.strip
    #         @@all << 
    #         puts "#{ranking}. #{title} - #{artist}"    
        end
    end

    def get_artist_chart
        # doc = Nokogiri.HTML(open(@@base_url + "/music/#{artist_name}"))
        # artist_name = gets.strip
        # binding.pry
    end

    
        
 
end #end of class

# Scraper.new.get_chart


# To give a list of the top 100 artist and be able to see their chart hisotry

# class Scraper1
    
#     # site = "https://www.billboard.com/music/#{artist_name}"
#     site = "https://www.billboard.com/music/taylor-swift"

#     doc = Nokogiri::HTML(open(site))
#     artist_name = 
#     artist_chart = doc.css("div.artist-section--chart-history__title-list").text


#     def list_of_artist
        
#     end


#     def chart_history
        
#     end

# end