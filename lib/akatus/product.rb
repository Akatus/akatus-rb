module Akatus
  class Product
    attr_accessor :code, :name, :quantity, :weight, :freight_amount, :discount_amount, :price

    def initialize(params = {})
      @code = params[:code]
      @name = params[:name]
      @quantity = params[:quantity]
      @weight = params[:weight]
      @freight_amount = params[:freight_amount]
      @discount_amount = params[:discount_amount]
      @price = params[:price]
    end
  end  
end  