require_relative 'fileparser.rb'

parse = FileParser.new
parse.file_to_hash('webserver.log')

puts 'List of Web Pages with Most Page Views'
p parse.most_views

puts 'List of Web Pages with Most Unique Views'
p parse.unique_views
