require_relative "../lib/methodCreator"
include MethodCreator
puts "Enter a method name :"
method_name = gets
puts "Enter a single line of code :"
code = gets
create_method(method_name ,code)
execute_method(method_name)
