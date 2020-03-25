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

  def percentage_occupied

    (total_number_of_products.to_f/capacity.to_f).round(4) * 100
  end

  def sorted_products_by_quantity

    highest_quantity = 0
    sorted_quantity = []
    products.each do |product|
      if  product.quantity >= highest_quantity
        highest_quantity = product.quantity
        sorted_quantity.unshift(product)
    elsif product.quantity < highest_quantity
        sorted_quantity << product
      end
    end
  sorted_quantity
  end

  def product_breakdown

    paper = products.select do |product|
      product.category == :paper
      end

    meat = products.select do |product|
      product.category == :meat
      end

    produce = products.select do |product|
      product.category == :produce
    end

    hash_breakdown = {
      :meat => meat,
      :paper => paper,
      :produce => produce
    }
    hash_breakdown
  end
end
