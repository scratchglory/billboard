require_relative './environment'



class Scraper
    @@base_url = "https://www.billboard.com"
    
    def self.get_chart # happens only once
        doc = Nokogiri::HTML(open(@@base_url + "/charts/hot-100"))   
        list_of_songs = doc.css("div.chart-list-item")

        list_of_songs.each do |song|     # iterating through each </div.chart-list-item>  # .each because it is being instantiated
            title = song.css("div.chart-list-item__title").text.strip
            artist = song.css("div.chart-list-item__artist").text.strip
            ranking = song.css("div.chart-list-item__rank").text.strip
            url = song.css("div.chart-list-item__artist a")[0] ? song.css("div.chart-list-item__artist a")[0].attributes["href"].value : "nil"
                # If index 0 has the attribute 'href' then execute, else 'nil'
            Song.create("#{title}", "#{artist}", "#{ranking}", "#{url}")
            # update so that Song.create instantiates a new Artist with name and url and sets new_song.artist equal to that artist instance
        end # do 
    end # get_chart

    def self.get_artist_details(artist_obj)
        doc = Nokogiri::HTML(open(@@base_url + artist_obj.url,'User-Agent' => 'ruby'))
        artist_details = doc.css("main#main")
            chart_history = artist_details.css("div.artist-section--chart-history__title-list__title__text a.artist-section--chart-history__title-list__title__text--title").text.strip
            # instead of instantiating a new artist, you'll update that existing artist object that was passed as an argument
            artist_obj.chart_history = chart_history
    end # get_artist_details

end # class
