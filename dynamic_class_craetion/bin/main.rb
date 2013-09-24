require_relative "../lib/csvParser"
puts "Enter CSV file name"
file_name = gets.chomp
object = CsvParser.new(file_name)
object.parseCsv
object.display
