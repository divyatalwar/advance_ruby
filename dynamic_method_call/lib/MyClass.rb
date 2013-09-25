class MyClass < String

  def exclude?string
    !include?(string)
  end

  def r_just(string , k)
    rjust(Integer(string),k)
  end

  def delete_char(arg1, *args)
  	delete arg1,*args
  end
  def myfunc(arg1, arg2, arg3 = "default1", arg4 = "default2")
    puts "function executed successfully"
  end
end
