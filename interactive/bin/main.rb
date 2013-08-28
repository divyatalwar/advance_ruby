require_relative "../lib/interactiveCode"
code = InteractiveCode.new
puts "Enter your code (NOTE : please enter a blank line to evaluate or you can enter 'q' to quit) :"
final_input = ""
loop do
  case gets
  when "\n" then break
  when /^q$/i then exit
  else final_input += $_
  end
end
puts final_input
puts "Result : "
puts code.execute(final_input)
