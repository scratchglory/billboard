# relative to the current file; within directory
require_relative "billboard/version"
require_relative './cli.rb'
require_relative './scraper.rb'
require_relative './song.rb'
require_relative './artist.rb'


# For external files
require "bundler/setup" # Configure the load path so all dependencies in your Gemfile can be required
require 'pry' 
require 'nokogiri' # parser gem
require 'open-uri' # request
require 'terminal-table' # table gem

