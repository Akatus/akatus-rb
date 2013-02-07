module Akatus
  class CreditCard

    attr_accessor :number,  :flag, :cvv, :expires_at, :holder_name, :holder_cpf, :holder_phone

    def initialize(attributes = {})
      attributes.each do |name, value|  
        send("#{name}=", value)  
      end  
    end
  end  
end  