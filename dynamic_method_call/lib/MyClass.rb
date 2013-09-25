class MyClass < String

  def exclude?string
    !include?(string)
  end

  def r_just(string , k)
    rjust(Integer(string),k)
  end

  def delete_char(*args)
  	delete *args
  end

end
