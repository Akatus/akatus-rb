module Akatus
  class Order
    attr_accessor :buyer_name, :buyer_email, :discount_amount, :freight_amount, :weight,
                  :payment_method, :installments, :products, :uuid, :credit_card, :address,
                  :phone

    def initialize(attributes = {})
      self.buyer_name       =    attributes[:buyer_name]
      self.buyer_email      =    attributes[:buyer_email]
      self.uuid             =    attributes[:uuid]
      self.discount_amount  =    attributes[:discount_amount]
      self.freight_amount   =    attributes[:freight_amount]
      self.weight           =    attributes[:weight]
      self.payment_method   =    attributes[:payment_method]
      self.installments     =    attributes[:installments]
      self.products         =    []
    end  

    def add_product(attributes = {})
      self.products << Product.new({
        :code             =>     attributes[:code],
        :name             =>     attributes[:name],
        :weight           =>     attributes[:weight],
        :quantity         =>     attributes[:quantity],
        :freight_amount   =>     attributes[:freight_amount],
        :discount_amount  =>     attributes[:discount_amount],
        :price            =>     attributes[:price]
      })  
    end  

    def credit_card(attributes = {})
      self.credit_card = CreditCard.new({
        :number           =>     attributes[:number],
        :cvv              =>     attributes[:cvv],
        :expires_at       =>     attributes[:expires_at],
        :flag             =>     attributes[:flag],
        :holder_name      =>     attributes[:holder_name],
        :holder_cpf       =>     attributes[:holder_cpf],
        :holder_phone     =>     attributes[:holder_phone]
      })
    end

    def address(attributes = {})
      self.address = Address.new({
        :postal_code    =>   attributes[:postal_code],
        :neighborhood   =>   attributes[:neighborhood],
        :street         =>   attributes[:street],
        :number         =>   attributes[:number],
        :complement     =>   attributes[:complement],
        :kind           =>   attributes[:kind],
        :city           =>   attributes[:city],
        :state          =>   attributes[:state],
        :country        =>   attributes[:country]
      })
    end
  end
end