require 'rubygems'
require 'bundler'
Bundler.require

# Models
require './models/books'

# Controllers
require './app'

run BooksApp

use Rack::MethodOverride
run BooksApp
