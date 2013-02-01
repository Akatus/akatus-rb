module Akatus
  class Order
    attr_accessor :buyer_name, :buyer_email, :discount_amount, :freight_amount, :weight,
                  :payment_method, :installments, :products

    def initialize(attributes = {})
      @buyer_name = attributes[:buyer_name]
      @buyer_email = attributes[:buyer_email]
      @discount_amount = attributes[:discount_amount]
      @freight_amount = attributes[:freight_amount]
      @weight = attributes[:weight]
      @payment_method = attributes[:payment_method]
      @installments = attributes[:installments]
      @products = []
    end

    def add_product(attributes = {})
      @products << Product.new({
        :code => attributes[:code],
        :name => attributes[:name],
        :weight => attributes[:weight],
        :quantity => attributes[:quantity],
        :freight_amount => attributes[:freight_amount],
        :discount_amount => attributes[:discount_amount],
        :price => attributes[:price]
      })
    end
  end
end
