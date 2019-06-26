require 'nokogiri'
require 'open-uri'
require 'pry'

# To give a list of the top 100 artist and be able to see their chart hisotry

class Scraper1
    
    url = "https://www.billboard.com/music/billie-eilish"
    doc = Nokogiri::HTML(open(url))

    artist_info = doc.css(".artist-section--chart-history__stats__header").text
    puts artist_info

end
