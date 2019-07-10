require_relative './environment'
require 'terminal-table'

class Billboard::CLI
    attr_accessor :song, :artist, :url, :ranking
 
    def call
        scrape_song
        welcome 
        menu
        artist_select
        reselect
    end #call
  
    def scrape_song # first needs to get called
        Scraper.get_chart
    end # end of scrape_song

    def welcome
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
        puts "\n"
        rows = []
        # binding.pry
        Song.all.each do |song|
            title = song.title
            artist = song.artist
            ranking = song.ranking
            url = song.url
            # puts "#{ranking}. #{title} - #{artist}"
            rows << [ranking, title, artist]
        end # end of do
        table = Terminal::Table.new :headings => ['Ranking', 'Song', 'Aritst(s)'], :rows => rows
        puts table
    end #list_of_songs
  
    def artist_select # Selecting the artist's chart history
        # puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        sleep(2)
        puts "\nTo see an artist chart history ranked by performance, enter the Artist's song number (1-100):"
        artist_input = gets.strip
         if artist_input.to_i > 0 && artist_input.to_i <= 100
             self.artist_performance_chart(artist_input)
         elsif artist_input == "exit!"
             goodbye
         else
             puts "It's either 1 to 100."
             artist_select
         end # end of if
    end  # artist_select

    def artist_performance_chart(input) # ouput of selected artist's chart
        selected_song = Song.all.find {|song| input == song.ranking}
        if selected_song.url == "nil"   #if the url of the artist is nil 
            puts "ERROR: Server Error or profile not found!"
        else # if the url exists in Artist class then
            Song.find_artist_by_name(selected_song.artist) || Scraper.get_artist_details(selected_song.url)
                puts "---------------------------------------------------------------"
                Artist.all.detect do |artist|
                    if selected_song.url == artist.url
                        puts "This is " + "#{selected_song.artist}'s" + " top performance chart:" 
                        songs = artist.songs
                        songs_split = songs.split("\n\n") 
                        songs_split.each.with_index(1) {|info, i| puts "#{i}. #{info}"}    
                    end # end of if
                end # end of do             
        end # end of if
            reselect         
    end # end of artist_performance_chart

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