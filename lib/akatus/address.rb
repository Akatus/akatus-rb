module Akatus
  class Address

    attr_accessor :postal_code, :neighborhood, :complement, :number, :street, :city, 
                  :state, :country, :kind

    def initialize(attributes = {})
      attributes.each do |name, value|  
        send("#{name}=", value)  
      end  
    end
  end  
end  
