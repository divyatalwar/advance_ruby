require_relative "exception"
module Calculator
  def validate_number
    format = /^[+-]?\d+(\.\d+)?$/
    raise NotNumeric , "Input is not a number" if !(format =~ self)
    self.to_f
  end
  
  def calculate(op1, operator, op2)
   operand1 =  op1.validate_number
   operand2 = op2.validate_number   
   operand1.send(operator, operand2)
   rescue NotNumeric
     puts $!
  end
end
