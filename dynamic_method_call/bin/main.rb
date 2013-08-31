require_relative "../lib/MyClass"
puts "Enter the string"
input_string = gets.chomp
object = MyClass.new(input_string)
puts "Enter method name out of the following to execute :"
puts MyClass.instance_methods(false)
puts "enter method name"
method_name = gets.chomp
no_of_arguments = object.method(method_name).arity
puts "#{no_of_arguments} arguments needed.Pls enter!!" if no_of_arguments > 0
argument = []
no_of_arguments.times do 
  argument << gets.chomp 
end 
argument.reject! { |element| element.empty?}
begin
  puts object.send method_name, *argument
rescue ArgumentError
  puts "Enter correct number of arguments. #{no_of_arguments}"
end
