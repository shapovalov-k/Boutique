class Product
  attr_reader :price, :amount, :total_amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
    @total_amount = @amount.to_i
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def to_s
    "#{price} руб. (осталось #{amount})"
  end

  def to_s_bis
    "#{price} руб. - #{total_amount - amount} шт."
  end
end
