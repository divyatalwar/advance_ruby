require_relative "../lib/calculator"
include Calculator
puts "enter the first operand"
operand1 = gets.chomp 
puts "enter the second operand"
operand2 = gets.chomp
puts "enter the operator(*,/,+,-)"
operator = gets.chomp
puts calculate(operand1, operator.to_sym, operand2)
