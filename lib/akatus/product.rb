module Akatus
  class Product
    attr_accessor :code, :name, :quantity, :weight, :freight_amount, :discount_amount, :price

    def initialize(attributes = {})
      attributes.each do |name, value|  
        send("#{name}=", value)  
      end  
    end
  end  
end  