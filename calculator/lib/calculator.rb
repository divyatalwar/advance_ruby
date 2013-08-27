require_relative "exception"
module Calculator
  def calculate(operand1, operator, operand2)
    raise InvalidNumber, "Not a valid number!!" if !(operand1.is_a?(Numeric) && operand2.is_a?(Numeric))   
    operand1.send(operator, operand2)
    rescue InvalidNumber
      puts $!
  end
end
