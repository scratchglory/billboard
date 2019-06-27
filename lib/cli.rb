
class Billboard::CLI
 
    def call
        puts "Welcome to the list of Billboards Top Hot 100 Songs!"
        puts "For a list of Billboard's 100, type 'list', or 'exit!' to exit."
        input = nil
        input = gets.strip
        until input == "exit!"
            case input
            when "list"
                puts "list of songs"
                break
            when "exit!"
                exit
            end #case
        end #loop

        # menu
        # list_of_songs
    end #call

    # def list_of_songs
    #     # should have the list of songs from Scraper class
    #     Scraper.get_chart
    # end
    
    # def menu
    #     # Select an artist from the menu you wish to see more info on 
    #     puts "To see more songs from the artist on the Top 100, enter a number from 1-100:"
    #     input = gets.strip
    #     if input.to_i.between?(1,100)
            
    #     end
    # end


end

