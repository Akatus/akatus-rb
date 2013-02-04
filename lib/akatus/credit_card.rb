module Akatus
  class CreditCard

    attr_accessor :number,  :flag, :cvv, :expires_at, :holder_name, :holder_cpf, :holder_phone

    def initialize(attributes = {})
      self.number = attributes[:number]
      self.flag = attributes[:flag]
      self.cvv = attributes[:cvv]
      self.expires_at = attributes[:expires_at]
      self.holder_name = attributes[:holder_name]
      self.holder_cpf = attributes[:holder_cpf]
      self.holder_phone = attributes[:holder_phone]
    end
  end  
end  