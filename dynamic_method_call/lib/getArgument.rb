class GetArgument
  attr_accessor :argument ,:instance,:method_name
  def initialize(method_name,instance)
  	@method_name = method_name
  	@instance = instance
  	@argument =[]
  end
  def variable_argument_input
	puts "Now enter variable arguments.Leave an empty line once done."
	loop do
      self.argument << eval(gets.chomp)
      break if $_.chomp.empty? 
    end
  end
  def fixed_argument_input(required_params) 
	puts "pls enter!!#{required_params} arguments"
	required_params.times do 
	  self.argument << eval(gets.chomp) 
	end 
  end
  def optional_argument_input(optional_params)
    puts "pls enter #{optional_params} optional arguments else we will take them by default "
	optional_params.times do
	  self.argument << eval(gets.chomp)
	end
  end
  def total_args
	puts self
	no_of_args = instance.method(method_name.to_sym).parameters
	required = 0 
    optional = 0 
    variable = 0
    for i in 0...no_of_args.length
      case no_of_args[i][0] 
	  when :req then required += 1
      when :opt then optional += 1
	  when :rest then variable += 1
	  end
	end
	print "U CAN ENTER ANY NUMBER OF ARGUMENTS!! \nMinimum " if variable > 0
	print "Requirement is: #{required}\nOptional(default values taken if not entered) is #{optional}\n"
    fixed_argument_input(required) if required > 0
    variable_argument_input if variable > 0
    optional_argument_input(optional) if optional > 0
    argument.reject! { |element| element.nil? }
    begin
      puts instance.send method_name , *argument
    rescue ArgumentError
      puts $!
    end
  end
end

