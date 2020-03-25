require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test

  def test_it_exists
    cart= ShoppingCart.new("King Soopers", "30items")
    assert_instance_of ShoppingCart, cart
  end

  def test_it_has_a_name
  cart= ShoppingCart.new("King Soopers", "30items")
  assert_equal 'King Soopers', cart.name
  end

  def test_it_has_a_capacity
    cart= ShoppingCart.new("King Soopers", "30items")
    assert_equal 30, cart.capacity
  end

  def test_it_starts_with_no_products
    cart= ShoppingCart.new("King Soopers", "30items")
    assert_equal [], cart.products
  end

  def test_it_can_add_products
    cart= ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    cart.add_product(product1)
    cart.add_product(product2)
    assert_equal [product1, product2], cart.products
  end

  def test_it_has_a_total_number_of_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    assert_equal 13, cart.total_number_of_products
  end

  def test_if_cart_is_full
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    assert_equal false, cart.is_full?
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product4)
    assert_equal true, cart.is_full?
  end

  def test_the_cart_has_products_by_category
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    assert_equal false, cart.is_full?
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product4)
    assert_equal [product1, product3], cart.products_by_category(:paper)
  end

  def test_it_has_details
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    assert_equal false, cart.is_full?
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product4)
    assert_equal ({:name=> "King Soopers", :capacity=> 30}), cart.details
  end

  def test_percentage_of_cart_occupied
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
end


# ```ruby
# pry(main)> require './lib/product'
# #=> true
#
# pry(main)> require './lib/shopping_cart'
# #=> true
#
# pry(main)> cart = ShoppingCart.new("King Soopers", "30items")
#
# #=> #<ShoppingCart:0x00007fccd30375f8...>
#
# pry(main)> product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
# #=> #<Product:0x00007fccd29b5720...>
#
# pry(main)> product2 = Product.new(:meat, 'chicken', 4.50, '2')
# #=> #<Product:0x00007fccd2985f48...>
#
# pry(main)> product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
#
# #=> #<Product:0x00007fccd2985f51...>
#
# pry(main)> cart.add_product(product1)
#
# pry(main)> cart.add_product(product2)
#
# pry(main)> cart.add_product(product3)
#
# pry(main)> cart.percentage_occupied
# #=> 43.33
#
# pry(main)> product4 = Product.new(:produce, 'apples', 0.99, '20')
#
# #=> #<Product:0x00007fccd2985f53...>
#
# pry(main)> cart.add_product(product4)
#
# pry(main)> cart.sorted_products_by_quantity
# #=> [#<Product:0x00007fccd2985f53...>, #<Product:0x00007fccd2985f51...>, #<Product:0x00007fccd2985f48...>, #<Product:0x00007fccd29b5720...>]
#
# pry(main)> cart.product_breakdown
# #=> {:meat=>[#<Product:0x00007fccd2985f48...>], :paper=> [#<Product:0x00007fccd29b5720...>, #<Product:0x00007fccd2985f51...>], :produce=> [#<Product:0x00007fccd2985f53...>]}
# ```
