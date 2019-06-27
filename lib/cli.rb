# itterate over hashes to return a song/artist

class Billboard::CLI
 
    def call
        welcome 
        menu
        # list_of_songs
    end #call
    
    def welcome
        puts "Welcome to the list of Billboards Top Hot 100 Songs!"
        puts "----------------------------------------------------"
        puts "For a list of Billboard's 100, type 'list', or 'exit!' to exit."
    end #welcome

    
    def menu
        input = nil
        while input != "exit!"
            input = gets.strip
            case input
            when "list"
                list_of_songs #calls on Song.create
                puts "\n\nTo see an artist chart history ranked by performance, enter the Artist's song number (1-100):"
                artist_input = gets.strip.to_i
            when artist_input == (0..100)
                puts "\nThis is the artist and their top songs from best to worst."
                puts "If you want a different artist, type 'list' again to see your options."
                break
            when "exit!"
                exit
            else 
                puts "It's either 'list' or 'exit!'"
            end #case
        end #loop 
        menu
    end # menu
    
    def list_of_songs
        # should have the list of songs from Scraper class
        chart = Scraper.get_chart
        chart.each do |song|
            title = song[:title]
            artist = song[:artist]
            ranking = song[:ranking]
        puts "#{ranking}. #{title} - #{artist}"  
        end

    end #list_of_songs


    # def list_of_artist_chart
        
    # end #list_of_artist_chart

end

