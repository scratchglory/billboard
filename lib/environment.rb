require_relative "billboard/version"
require_relative './cli.rb'
require_relative './scraper.rb'
require_relative './song.rb'
require_relative './artist.rb'

require "bundler/setup" # Configure the load path so all dependencies in your Gemfile can be required
require 'pry'
require 'nokogiri'
require 'open-uri'

# I don't think I need because it isn't being called on anywhere
# module Billboard_Top_100
#   class Error < StandardError; end
#   # Your code goes here...
# end
