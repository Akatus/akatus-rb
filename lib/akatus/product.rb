module Akatus
  class Product
    attr_accessor :code, :name, :quantity, :weight, :freight_amount, :discount_amount, :price

    def initialize(params = {})
      self.code = params[:code]
      self.name = params[:name]
      self.quantity = params[:quantity]
      self.weight = params[:weight]
      self.freight_amount = params[:freight_amount]
      self.discount_amount = params[:discount_amount]
      self.price = params[:price]
    end
  end  
end  