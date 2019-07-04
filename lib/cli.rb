# itterate over hashes to return a song/artist
require_relative './environment'
require 'pry'
class Billboard::CLI
    attr_accessor :song, :artist, :url, :ranking
 
    def call
        # Song # testing pry
        welcome 
        menu
        artist_select
    end #call

    def welcome
        puts "Welcome to the list of Billboards Top Hot 100 Songs!"
        puts "----------------------------------------------------"
        puts "For a list of Billboard's 100, type 'list', or 'exit!' to exit."
    end #welcome

    def menu # list or exit
        input = gets.strip
        case input
        when "list"
            list_of_songs
        when "exit!"
            puts "Peace!"
            exit
        else 
            puts "It's either 'list' or 'exit!'"
            menu
        end #loop 
    end # menu
 
    def list_of_songs
        # should have the list of songs from Scraper class
        song_chart = Scraper.get_chart
        song_chart.each do |song|
            title = song[:title]
            artist = song[:artist]
            ranking = song[:ranking]
            url = song[:url]
            new_song = Song.create(title, artist, ranking, url)  # This is adding to the Song class
            puts "#{new_song.ranking}. #{new_song.title} - #{new_song.artist}"  
        end # end of do
    end #list_of_songs
    
    def artist_select
        puts "\n\nTo see an artist chart history ranked by performance, enter the Artist's song number (1-100):"
        artist_input = gets.strip
         if artist_input.to_i > 0 && artist_input.to_i <= 100
             self.artist_url(artist_input)
            #  list_of_artist_chart
         elsif artist_input == "exit!"
             puts "Keep on listening. Peace!"
             exit
         else
             puts "It's either 1 to 100."
             artist_select
         end # end of if
    end  # artist_select
    
    def artist_url(input) 
        @@selected_song = Song.all.detect do |song|       # iterates through Song.all and outputs the artist that matches the artist that chosen
            input == song.ranking
        end # end of do    

            if @@selected_song.url == "nil"   #if the artist name isn't nil and the url of the artist is nil 
                puts "ERROR: There is no profile"
            else
                puts "\nThis is " + "#{@@selected_song.artist}'s" + " top 5 performance chart:" 
                artist_chart = Scraper.new.get_artist_details
                history = artist_chart.flatten.map do |info|     
                        info.split("\n\n")
                    end # end of do
                history.flatten!
                artist_history = history.flatten.each.with_index(1) {|info, i| p "#{i}. #{info}"}
                # binding.pry
                Artist.create(@@selected_song.artist, artist_history)
            end # end of if
            artist_select
    end # end of artist
end # end of class