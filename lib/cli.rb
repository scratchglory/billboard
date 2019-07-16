require 'terminal-table'

class Billboard::CLI
    attr_accessor :song, :artist, :url, :ranking
 
    def call
        scrape_song
        welcome 
        menu
        artist_select
        reselect
    end # call
  
    def scrape_song # first needs to get called
        Scraper.get_chart
    end # scrape_song

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
    end # welcome

    def menu # list or exit
        input = gets.strip.downcase
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
        Song.all.each do |song|  # Expose the @@all class variable by calling the #all method on the Song class
            title = song.title
            artist = song.artist.name
            ranking = song.ranking
            rows << [ranking, title, artist] # returns array of arrays
        end # end of do
        table = Terminal::Table.new :headings => ['Ranking', 'Song', 'Artist(s)'], :rows => rows  # be explicit
        puts table
    end # list_of_songs
  
    def artist_select # Selecting the artist's chart history
        sleep(2)
        puts "\nTo see an artist chart history ranked by performance, enter the Artist's song number (1-100):"
        artist_input = gets.strip.downcase
        if (1..100).include?(artist_input.to_i) # has to be in integer to use the range
            self.artist_performance_chart(artist_input)
        elsif artist_input == "list"
            list_of_songs
        elsif artist_input == "exit!"
            goodbye
        else
            puts "It's either 1 to 100."
            artist_select
        end # end of if
    end  # artist_select

    def artist_performance_chart(input) # ouput of selected artist's chart
        selected_song = Song.find_by_ranking(input) # has to be a string
        if selected_song.artist.url == "nil"   
            puts "ERROR: Server Error or profile not found!"
        else
            selected_song.artist.chart_history || Scraper.get_artist_details(selected_song.artist)
            puts "---------------------------------------------------------------"
            puts "This is " + "#{selected_song.artist.name}'s" + " top performance chart:" 
            songs_split = selected_song.artist.chart_history.split("\n\n") 
            songs_split.each.with_index(1) {|info, i| puts "#{i}. #{info}"}    
        end # if
            reselect         
    end # artist_performance_chart

    def reselect
        sleep(2)
        puts "---------------------------------------------------------------"
        puts "Enter 'list' to see the list and choose an artist's chart again"
        puts "Enter 'exit!' to exit"
        input = gets.strip.downcase
        if input == "exit!"
            goodbye
        elsif input == "list"
            list_of_songs
            artist_select
        else 
            puts "It's either 'list' or 'exit!'"
            reselect
        end # if 
    end # reselect

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
    end # goodbye

end # class