class Checkout

	PRODUCT_PRICE = { "001" =>  9.25, "002" =>  45.00, "003" => 19.95 }


	def initialize(promotional_rules = {})
		@promotional_rules = promotional_rules
		@basket = []
	end


	def scan(item)
		@basket << item
	end


	def total
		total = 0.00

		@basket.each { |item| total += item_price_with_discount(item) }

		total -= basket_total_discount(total)
		
		return total.round(2)
	end



  private

  def item_price_with_discount(item)
    if (current_rule = @promotional_rules[:multi_product_discounts][item]) && (@basket.count(item) >= current_rule[:or_more_quantity])
      return current_rule[:discounted_price]
    else
      return PRODUCT_PRICE[item]
    end
  end


  def basket_total_discount(amount = 0.00)
     if amount > @promotional_rules[:total_discount][:apply_at]
      return amount * (@promotional_rules[:total_discount][:percentage_off] / 100)
    else
      return 0.00
    end
  end

end



promotional_rules = {
	:total_discount => { :apply_at => 60.00, :percentage_off => 10.00 },
	:multi_product_discounts => {
		"001" => { :or_more_quantity => 2, :discounted_price => 8.50 }
		}
	}

#test one
co = Checkout.new(promotional_rules)
co.scan("001")
co.scan("002")
co.scan("003")
puts co.total

#test two
co = Checkout.new(promotional_rules)
co.scan("001")
co.scan("003")
co.scan("001")
puts co.total

#test three
co = Checkout.new(promotional_rules)
co.scan("001")
co.scan("002")
co.scan("001")
co.scan("003")
puts co.total

