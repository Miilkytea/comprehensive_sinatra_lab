require 'rubygems'
require 'bundler'
Bundler.require

# Models
require './models/book'

# Controllers
require './app'

run BooksApp

use Rack::MethodOverride
run BooksApp
