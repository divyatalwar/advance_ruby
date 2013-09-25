require_relative "../lib/MyClass"
require_relative "../lib/getArgument"
puts "Enter the string"
input_string = gets.chomp
object = MyClass.new(input_string)
puts "Enter method name out of the following to execute :"
puts MyClass.instance_methods(false)
puts "enter method name"
method_name = gets.chomp
arg_object = GetArgument.new(method_name,object)
arg_object.total_args
