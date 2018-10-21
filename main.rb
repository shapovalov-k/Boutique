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

product_collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

product_collection.sort!(by: :price, order: :asc)

user_input = nil
price = 0
user_basket = []

while user_input != 0

  puts "Что хотите купить:"

  product_collection.to_a.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end
  puts "0. Выход"

  user_input = STDIN.gets.to_i

  user_choice = product_collection.products[user_input - 1]

  puts user_choice

  if user_input != 0
    user_basket << user_choice
    puts user_choice.update(amount: user_choice.amount.to_i - 1 )
    price += user_choice.price.to_i

    puts "Вы выбрали: #{user_choice}"
    puts "Всего товаров на сумму: #{price} руб."
  else
    puts "Вы купили:"
    user_basket.each { |choice| puts choice}

    puts "С Вас — #{price} руб. Спасибо за покупки!"
  end
end



