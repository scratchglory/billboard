# itterate over hashes to return a song/artist

class Billboard::CLI

    attr_accessor :song, :artist, :url, :ranking
 
    def call
        Scraper.get_artist_details
        # Song
        welcome 
        menu
        artist_select
        # list_of_artist_chart
    end #call
    
    def welcome
        puts "Welcome to the list of Billboards Top Hot 100 Songs!"
        puts "----------------------------------------------------"
        puts "For a list of Billboard's 100, type 'list', or 'exit!' to exit."
    end #welcome
# taking and user input
    
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
            end #case
        end #loop 
    end # menu

    def songs
       @song = Song.all
    end

    
    def artist_select
        puts "\n\nTo see an artist chart history ranked by performance, enter the Artist's song number (1-100):"
        artist_input = gets.strip
        if artist_input.to_i > 0 && artist_input.to_i <= 100
            # list_of_artist_chart#(artist_input)


        elsif artist_input == "exit!"
            puts "Keep on listening. Peace!"
            exit
        else
            puts "It's either 1 to 100."
            artist_select
        end # end of if
    end  # artist_select


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
        # binding.pry
    end #list_of_songs


    def list_of_artist_chart(artist_input)        
    #     puts "This"
        
        selected_song = Song.all.detect do |song|       # iterates through Song.all and outputs the artist that matches the artist that chosen
            artist_input == song.ranking
        end    
        binding.pry
        if selected_song.artist != nil && selected_song.url == nil   #if the artist name isn't nil and the url of the artist is nil 
           Song.url
            # Scraper.get_artist_detail(artist_info)
            # artist_chart = Scraper.get_artist_details(song.artist)     # the URL of the artist chosen/matched
            # Artist.all << artist_chart  # add to the array of Artist collection
        end 
        # puts the details from the newly updated artist_obj returned from Scraper

    #    if whatever_was_chosen == Artist.name  ## could we use unless in the code above?
    #         puts "ERROR"
    #     end

    end #list_of_artist_chart


