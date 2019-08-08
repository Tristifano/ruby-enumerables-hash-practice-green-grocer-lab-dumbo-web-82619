def consolidate_cart(cart)
  new_cart = {}
  cart.each {|object|
    object.each {|item,info|
      if new_cart[item] 
        new_cart[item][:count] += 1
      else
        new_cart[item] = info
        new_cart[item][:count] = 1
      end
    }
  }
  new_cart
end

def apply_coupons(cart, coupons)
 
    coupons.each { |deal|
    item = deal[:item]
    couponed_item = "#{item} W/COUPON"
    discounted_item_cost = deal[:cost] / deal [:num]
    original_item = cart[item]
    coupon_num = deal[:num]
    if cart.include?(item) && cart.include?(couponed_item)
      cart_count = original_item[:count]
      updated_count = cart_count - coupon_num
      original_item[:count] = updated_count
      cart[couponed_item][:count] = cart[couponed_item][:count] + deal[:num]
    elsif cart.include?(item)
    cart_count = original_item[:count]
    updated_count = cart_count - coupon_num
    original_item[:count] = updated_count
      cart[couponed_item] = {:price => discounted_item_cost, :clearance => original_item    [:clearance], :count => deal[:num] }
    end
    }
    cart
end

def apply_clearance(cart)
  cart.map {|item|
    if item[:clearance]
      item[:price] = item[:price] * .20
  }
end

def checkout(cart, coupons)
  # code here
end
