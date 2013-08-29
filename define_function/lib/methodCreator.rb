module MethodCreator
  def create_method(method_name, code)
    instance_eval %{
      def #{ method_name } 
        #{ code } 
      end
    }                                                                   
  end
  def execute_method(method_name)
    eval(method_name)
  end
end
