require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './environment'

class Scraper

   url = "https://www.billboard.com/charts/hot-100"
   doc = Nokogiri.HTML(open(url))
   song_title = doc.css("div.chart-list-item__title")
   artist = doc.css("div.chart-list-item__artist")
   ranking = doc.css("div.chart-list-item__rank")
   
   list_of_songs = doc.css("div.chart-list-item")

   list_of_songs.each do |song|     # iterating through each </div>
        title = song.css("div.chart-list-item__title").text.strip
        artist = song.css("div.chart-list-item__artist").text.strip
        ranking = song.css("div.chart-list-item__rank").text.strip
        puts "#{ranking}. #{title} - #{artist}"
   end

    # def artist
    #     artist.each do |artist|
    #         puts artist.text.strip
    #     end  
    # end

    # def ranking
    #     puts ranking.text
    # end


    
# To give a list of the top 100 artist and be able to see their chart hisotry

class Scraper1
    
    url = "https://www.billboard.com/music/billie-eilish"
    doc = Nokogiri::HTML(open(url))

    artist_info = doc.css(".artist-section--chart-history__stats__header").text
    puts artist_info

end



    
end

