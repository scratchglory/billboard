# itterate over hashes to return a song/artist
require_relative './environment'
require 'pry'
class Billboard::CLI
    attr_accessor :song, :artist, :url, :ranking
 
    def call
        # Scraper.new.get_artist_details0("/music/drake")
        welcome 
        menu
        artist_select
        reselect
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
            goodbye
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
            puts "#{new_song.ranking}. #{new_song.title} - #{new_song.artist} - #{new_song.url}" 
        end # end of do
    end #list_of_songs
    
    def artist_select # Selecting the artist's chart history
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "\nTo see an artist chart history ranked by performance, enter the Artist's song number (1-100):"
        artist_input = gets.strip
         if artist_input.to_i > 0 && artist_input.to_i <= 100
             self.artist_url(artist_input)
            #  list_of_artist_chart
         elsif artist_input == "exit!"
             goodbye
         else
             puts "It's either 1 to 100."
             artist_select
         end # end of if
    end  # artist_select

    def artist_url(input) 
        @@selected_song = Song.all.detect do |song|       # iterates through Song.all and outputs the artist that matches the artist that chosen
            input == song.ranking
        end # end of do    
        # binding.pry
            # if
                # puts "------------------------------------------------------------------------"
                # puts "This is " + "#{@@selected_song.artist}'s" + " top 5 performance chart:" 
                # artist_chart = Scraper.new.get_artist_details0(@@selected_song.url)
                # history = artist_chart.each do |info|
                #     i = 0
                #     name = info[:name]
                #     songs = info[:songs]
                #     url = info[:url]
                #     chart = Artist.create(name, songs, url) 
                #     songs_split = chart.songs.split("\n\n") 
                #     songs_split.each.with_index(1) {|info, i| puts "#{i}. #{info}"}
              
                # end # end of do
                if @@selected_song.url == "nil"   #if the artist name isn't nil and the url of the artist is nil 
                    puts "ERROR: Server Error or profile not found!"
                else  # if the @@selected_song.url != Artist.all
                puts "######################"
                artist_chart = Scraper.new.get_artist_details0(@@selected_song.url)
                Artist.all.detect do |artist|
                    # binding.pry
                    @@selected_song.url == artist[:url]
                    puts "This is " + "#{@@selected_song.artist}'s" + " top 5 performance chart:" 
                    songs = artist[:songs]
                    songs_split = songs.split("\n\n") 
                    songs_split.each.with_index(1) {|info, i| puts "#{i}. #{info}"}
                end # end of do
                puts Artist.all
                # else Artist.all.detect {|info| info[:url] == selected_song}
                #     puts "---------------"
                #     puts "This is " + "#{@@selected_song.artist}'s" + " top 5 performance chart:" 
                #     # songs = 
                #     # songs_split = songs.split("\n\n") 
                #     # songs_split.each.with_index(1) {|info, i| puts "#{i}. #{info}"}
            #  puts Artist.all
            end 
            # binding.pry
            reselect         
    end # end of artist_url

    def reselect
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
        puts "Keep on listening. Peace Out!"
        exit
    end # end of goodbye

end # end of class