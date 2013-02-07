module Akatus
  class Order
    attr_accessor :buyer_name, :buyer_email, :discount_amount, :freight_amount, :weight,
                  :payment_method, :installments, :products, :reference, :credit_card, :address,
                  :phone

    def initialize(attributes = {})
      attributes.each do |name, value|  
        send("#{name}=", value)  
      end  
      self.products = []
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
      @credit_card ||= CreditCard.new({
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
      @address ||= Address.new({
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

    def phone(attributes = {})
      @phone ||= Phone.new({
        :kind     => attributes[:kind],
        :number   => attributes[:number]
      })
    end

    def credit_card?
      %w{visa master amex diners elo hipercard}.include? payment_method
    end  
  end
end
