# encoding: utf-8
#
# Программа-магазин книг и фильмов. Версия 0.1 — заготовка.
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/disc'
require_relative 'lib/product_collection'
require_relative 'lib/client_basket'

product_collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
product_collection.sort!(by: :price, order: :asc)

client_basket = ClientBasket.new

user_input = nil

while user_input != 0
  puts "\nЧто хотите купить:"

  product_collection.to_a.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end
  puts "0. Выход"

  user_input = STDIN.gets.to_i

  user_choice = product_collection.products[user_input - 1]


  if (user_input != 0) && (user_choice.amount.to_i > 0)
    puts puts "Вы выбрали: #{user_choice}"

    puts client_basket.add_new_product(user_choice)

    puts "Всего товаров на сумму:"
    puts client_basket.show_basket_price
  elsif user_choice.amount.to_i == 0
    puts "К сожалению, этот товар уже закончился."
  else
    puts "Вы купили:"
    client_basket.items.each { |item| puts item }

    puts "С Вас — #{client_basket.show_basket_price} руб. Спасибо за покупки!"
  end
end



