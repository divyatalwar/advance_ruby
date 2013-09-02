module DynamicClassCreator
	def create_class(class_name, csv_row )
		new_class = Class.new do
  	  def initialize args
		    args.each do | key, value |
			    self.instance_variable_set( "@#{ key }", value )
				end
			end
      csv_row.fields.each do |column|
				(class << self; self; end).instance_eval do
				  define_method(column) do
					  ObjectSpace.each_object( self ).collect { | object | object.instance_variable_get( "@#{ column }" ) } 
  				end
				end
			end
    end
   Object.const_set class_name , new_class
  end
end
