# itterate over hashes to return a song/artist
require_relative './environment'
require 'open-uri'
require 'pry'
class Billboard::CLI
    attr_accessor :song, :artist, :url, :ranking
 
    def call
        song_scraper
        artist_scraper
        puts " 
 _____________________________________________________________________________
|  ____   _  _  _  _                             _  _       __   ___    ___   |
| |  _   (_)| || || |                           | |( )     /_ | / _    / _    |
| | |_) | _ | || || |__    ___    __ _  _ __  __| ||/ ___   | || | | || | | | |
| |  _ < | || || || '_    / _    / _` || '__|/ _` |  / __|  | || | | || | | | |
| | |_) || || || || |_) || (_) || (_| || |  | (_| |   __    | || |_| || |_| | |
| |____/ |_||_||_||_.__/   ___/   __,_||_|    __,_|  |___/  |_|  ___/   ___/  |
|_____________________________________________________________________________|
								 By Adella :)"
        welcome 
        menu
        artist_select
        reselect
    end #call
  
    def song_scraper # first needs to get called
        Scraper.get_chart
    end # end of song_scraper

    def artist_scraper
            Song.all.each do |song|
                if song[:url] != "nil"
                    artist = Scraper.new.get_artist_details(song[:url])
                    artist
                end # end of if
            end # end of do
    end # end of artist_scraper

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
            goodbye
        else 
            puts "It's either 'list' or 'exit!'"
            menu
        end #loop 
    end # menu
 

    # should have the list of songs from Scraper class
    def list_of_songs
        # song_chart = Scraper.get_chart
        # song_chart.each do |song|
        #     title = song[:title]
        #     artist = song[:artist]
        #     ranking = song[:ranking]
        #     url = song[:url]
        #     new_song = Song.create(title, artist, ranking, url)  # This is adding to the Song class
        #     puts "#{new_song.ranking}. #{new_song.title} - #{new_song.artist} - #{new_song.url}" 
        # end # end of do

        Song.all.each do |song|
            title = song[:title]
            artist = song[:artist]
            ranking = song[:ranking]
            url = song[:url]
            puts "#{ranking}. #{title} - #{artist}"
        end # end of do
    end #list_of_songs
    
    def artist_select # Selecting the artist's chart history
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "\nTo see an artist chart history ranked by performance, enter the Artist's song number (1-100):"
        artist_input = gets.strip
         if artist_input.to_i > 0 && artist_input.to_i <= 100
             self.artist_url(artist_input)
         elsif artist_input == "exit!"
             goodbye
         else
             puts "It's either 1 to 100."
             artist_select
         end # end of if
    end  # artist_select

    def artist_url(input) 
        selected_song = Song.all.detect do |song|       # iterates through Song.all and outputs the artist that matches the artist that chosen
            input == song[:ranking]
        end # end of do    
            # if
                # puts "------------------------------------------------------------------------"
                # puts "This is " + "#{selected_song.artist}'s" + " top 5 performance chart:" 
                # artist_chart = Scraper.new.get_artist_details(selected_song.url)
                # history = artist_chart.each do |info|
                #     i = 0
                #     name = info[:name]
                #     songs = info[:songs]
                #     url = info[:url]
                #     chart = Artist.create(name, songs, url) 
                #     songs_split = chart.songs.split("\n\n") 
                #     songs_split.each.with_index(1) {|info, i| puts "#{i}. #{info}"}
                # end # end of do
                if selected_song[:url] == "nil"   #if the url of the artist is nil 
                    puts "ERROR: Server Error or profile not found!"
                else
                    puts "---------------------------------------------------------------"
                    Artist.all.detect do |artist|
                        if selected_song[:url] == artist[:url]
                            puts "This is " + "#{selected_song[:artist]}'s" + " top performance chart:" 
                            songs = artist[:songs]
                            songs_split = songs.split("\n\n") 
                            songs_split.each.with_index(1) {|info, i| puts "#{i}. #{info}"}
                        end
                    end # end of do
                    # binding.pry
                end # end of if
        
                # else Artist.all.detect {|info| info[:url] == selected_song}
                #     puts "---------------"
                #     puts "This is " + "#{selected_song.artist}'s" + " top 5 performance chart:" 
                #     # songs = 
                #     # songs_split = songs.split("\n\n") 
                #     # songs_split.each.with_index(1) {|info, i| puts "#{i}. #{info}"}
            #  puts Artist.all
            reselect         
    end # end of artist_url

    def reselect
        sleep(2)
        puts "---------------------------------------------------------------"
        puts "Enter 'list' to see the list and choose an artist's chart again"
        puts "Enter 'exit!' to exit"
        input = gets.strip
        if input == "exit!"
            goodbye
        elsif input == "list"
            list_of_songs
            artist_select
        else 
            puts "It's either 'list' or 'exit!'"
            reselect
        end # end of if 
    end # end of reselect

    def goodbye
        puts "Keep on listening!"
        puts "
         _                       ____
        ( )                     |____|
     ___|/________|)____________|____|_______
    |__/|/_)_|____|_______|)__(_)__(_)_______|
    |_(_|_/__|__(_)_______| _________________|
    |___|____|__________(_)__________________|
    |________|_________________________(_)___|
                                         |
                                         |)"   

        exit
    end # end of goodbye

end # end of class