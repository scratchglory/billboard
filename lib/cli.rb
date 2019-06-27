
class Billboard::CLI
 
    def call
        puts "Welcome to the list of Billboards Top Hot 100 Songs!"
        puts "For a list of Billboard's 100, type 'list', or 'exit!' to exit."
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

        # menu
        # list_of_songs
    end #call

    def list_of_songs
        # should have the list of songs from Scraper class
        Scraper.get_chart
    end
    
    # def menu
    #     # Select an artist from the menu you wish to see more info on 
    #     puts "To see more songs from the artist on the Top 100, enter a number from 1-100:"
    #     input = gets.strip
    #     if input.to_i.between?(1,100)
            
    #     end
    # end


end

