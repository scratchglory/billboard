require 'nokogiri'
require 'open-uri'
require 'pry'


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
        puts ranking
        puts title
        puts artist
   end
    
#    def song_title
#         song_title.each.with_index do |song, i|
#             puts "#{i + 1}. #{song.text.strip}"
#         end
#    end


    # def artist
    #     artist.each do |artist|
    #         puts artist.text.strip
    #     end  
    # end

    # def ranking
    #     puts ranking.text
    # end



    
end

