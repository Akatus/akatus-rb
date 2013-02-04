module Akatus
  class Address

    attr_accessor :postal_code, :neigborhood, :number, :street, :city, :state, :country, :kind, :country

    def initialize(attributes = {})
      self.postal_code = attributes[:postal_code]
      self.neigborhood = attributes[:neigborhood]
      self.number = attributes[:number]
      self.street = attributes[:street]
      self.city = attributes[:city]
      self.state = attributes[:state]
      self.country = attributes[:country]
      self.kind = attributes[:kind]
    end
  end  
end  