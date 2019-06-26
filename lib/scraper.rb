require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

   url = "https://www.billboard.com/charts/hot-100"
   doc = Nokogiri.HTML(open(url))
   song_title = doc.css("div.chart-list-item__title")
   artist = doc.css("div.chart-list-item__artist")
   ranking = doc.css("div.chart-list-item__rank")
    
#    song_title.each.with_index do |song, i|
#     puts "#{i + 1}. #{song.text.strip}"

    def song_title
        song_title.each do |song|
            puts song.text.strip
        end
    end

    def artist
        puts artist.text.strip    
    end

    def ranking
        puts ranking.text
    end

    puts song_title

    
end

