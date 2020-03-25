require './lib/product'
require 'pry'
class ShoppingCart
  attr_reader :name, :capacity, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products

    total_quantity = 0
    products.each do |product|
      total_quantity += product.quantity
    end
    total_quantity
  end

  def is_full?
    total_number_of_products > @capacity
  end

  def products_by_category(category)


    catagory_products= products.select do |product|
      product.category == category
    end
    catagory_products
  end

  def details

    details_hash = {
      :name => name,
      :capacity => capacity
    }
    details_hash
  end
end
