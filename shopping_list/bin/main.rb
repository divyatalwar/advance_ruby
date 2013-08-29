require_relative "../lib/shoppingList"
sl = ShoppingList.new
sl.items do
  add("Toothpaste",2)
  add("Computer",1)
end
sl.show_list_items
