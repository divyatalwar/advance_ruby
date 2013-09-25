require_relative "../lib/MyClass"
puts "Enter the string"
input_string = gets.chomp
object = MyClass.new(input_string)
puts "Enter method name out of the following to execute :"
puts MyClass.instance_methods(false)
puts "enter method name"
method_name = gets.chomp
no_of_arguments = object.method(method_name).arity
argument = []
if no_of_arguments > 0
  puts "#{no_of_arguments} arguments needed.Pls enter!!" 
  no_of_arguments.times do 
  input = gets.chomp
  argument << input 
end 
else
  puts "you can enter variable number of arguements.leave an empty line once u are done"
  while !$_.chomp.empty?
	  argument << gets.chomp
  end
end
argument.reject! { |element| element.empty?}
begin
  puts object.send method_name, *argument
rescue ArgumentError
  puts "Enter correct number of arguments. #{no_of_arguments}"
end
