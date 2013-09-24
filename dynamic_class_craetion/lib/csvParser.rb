require "csv"
class CsvParser
  attr_accessor :file_name , :headers,:rows
  def initialize(filename,headers=[],rows=[])
    @file_name = filename
	  @headers = []
    @rows = []
  end
  def filePath
	  "#{ File.dirname(__FILE__) }/#{ file_name }"
	end
  def create_custom_class
    temp_array=[]
    correct_format = headers.collect { |var| "i"+ var.gsub(" ","_")}
    symbols = correct_format.collect(&:to_sym)
    for i in 0...headers.length
      temp_array[2*i] = headers[i]
      temp_array[2*i+1] = correct_format[i]
    end
    @key_hash = Hash[*temp_array]
    new_class = Class.new do
      attr_accessor *symbols
      def show_data  
        output = ''
        instance_variables.each { |ivar| output += ( eval ivar.to_s)+ " "  }
        output
      end
    end
    Object.const_set className , new_class
  end
  def create_custom_class_obj(data)
    obj = Object.const_get(className).new
    data.each do | key, value |
      obj.send("#{ @key_hash[key] }=", value)
    end
  end
  def parseCsv
    row = [] 
    options = {:headers => true, :return_headers => false}
    CSV.open( filePath, "r", options ) do |csv|
      row = csv.find_all { |r| r }
      self.headers = csv.headers
    end
    create_custom_class
    row.each do |r|
      rows.push create_custom_class_obj(r)
    end
  end
  def className
    file_name.split('.')[0].chop.capitalize
  end
  def display
    class_name = Object.const_get(className)
    ObjectSpace.each_object( class_name ).collect { | object | p object,object.show_data}
  end 
end

