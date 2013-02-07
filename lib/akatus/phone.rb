module Akatus
  class Phone

    attr_accessor :kind, :number

    def initialize(attributes = {})
      attributes.each do |name, value|  
        send("#{name}=", value)  
      end  
    end
  end  
end  