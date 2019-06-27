
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
                list_of_songs
                puts "\n\nTo see an artist chart history ranked by performance, enter the Artist's song number (1-100):"
                artist_input = gets.strip
                puts "\nThis is the artist and their top songs from best to worst."
                break
            when "exit!"
                exit
            end #case
        end #loop 
    end # menu
    
    def list_of_songs
        # should have the list of songs from Scraper class
        Song.create
    end #list_of_songs
    
end

