require_relative "item"
class ShoppingList
  def initialize
    @list = []
  end

  def add(name, quantity)
    item = Item.new(name, quantity)
    @list.push(item)
  end

  def items(&block)
    instance_eval(&block)
  end
  
  def show_list_items
    @list.each { |item| puts "Name: #{ item.name }  Quantity = #{ item.quantity }" }
  end

end
