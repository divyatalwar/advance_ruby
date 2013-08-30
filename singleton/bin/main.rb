animal = "cat"
#method1
def animal.to_upcase
  upcase
end
puts animal.to_upcase

#method2
animal.instance_eval do
  class << self
    def to_downcase
      upcase
    end
  end
end

puts animal.to_downcase

