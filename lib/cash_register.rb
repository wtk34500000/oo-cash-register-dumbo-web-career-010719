
require 'pry'
class CashRegister
    attr_accessor :discount, :total, :title, :quantity

    def initialize(discount=nil)
        @total=0.0
        if discount
            @discount=discount
        end
        @listItems=[]
    end

    def add_item(title, price, quantity=nil)
        if quantity 
            @total+=price * quantity
            count=quantity
            while count > 0
                @listItems<<title
                count-=1
            end
            
        else
            @total+=price
            @listItems<<title
        end
    end

    def apply_discount
        if discount
            discount_value=(@total * (discount*0.01))
            @total=@total-discount_value
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @listItems
    end

    def void_last_transaction
        @total=0.0
    end

end

