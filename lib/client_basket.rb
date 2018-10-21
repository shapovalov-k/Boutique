class ClientBasket
  attr_reader :items

  def initialize
    @items = []
  end

  def add_new_product(product)
    @items << product
    product.update(amount: product.amount.to_i - 1)
  end

  def show_basket_price
    @items.inject(0){|sum,x| sum + x.price.to_i}
  end
end