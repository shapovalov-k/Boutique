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
require_relative 'lib/product_collection'

product_collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

product_collection.sort!(by: :price, order: :asc)

product_collection.to_a.each do |product|
  puts product
end

# current_path = File.dirname(__FILE__)
# film = Film.from_file(current_path + '/data/films/1.txt')
# book = Film.from_file(current_path + '/data/books/1.txt')

# products = []
# products << Film.new(title: "Leon", year: 1994, director: "Люк Бессон", price: 990, amount: 5)
# products << Film.new(title: "Дурак", year: 2014, director: "Юрий Быков", price: 390, amount: 1)
# products << Book.new(title: "Идиот", genre: "роман", author: "Федор Достоевский", price: 1500, amount: 10)
# puts 'Вот какие товары у нас есть:'
# products.each { |product| puts product }

