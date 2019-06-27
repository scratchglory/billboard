require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './environment'

class Scraper
    @@base_url = "https://www.billboard.com"

    def self.get_chart
        doc = Nokogiri.HTML(open(@@base_url + "/charts/hot-100"))   
    end

    def get_artist_chart
        doc = Nokogiri.HTML(open(@@base_url + "/music" + "/#{@artist}"))
    end # get_artist_chart

end #end of class