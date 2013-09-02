require_relative "../lib/dynamicClasscreator"
require "csv"
include DynamicClassCreator
array = []
puts "Enter CSV file name"
file_name = gets.chomp
file_path = "#{ File.dirname(__FILE__) }/#{ file_name }"
class_name = file_name.split('.')[0].chop.capitalize
CSV.foreach(file_path, :headers => true, :return_headers => true) do |object|
  if object.header_row?
    create_class(class_name, object)
  else
    array.push((Object.const_get(class_name).new(object)))
  end
end
array.each { |a| puts a.inspect }
Object.const_get(class_name).singleton_methods.each { |method| print method , "," }
puts Object.const_get(class_name).name
puts Object.const_get(class_name).age
puts Object.const_get(class_name).city

