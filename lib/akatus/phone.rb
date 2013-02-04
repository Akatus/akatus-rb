module Akatus
  class Phone

    attr_accessor :kind, :number

    def initialize(attributes = {})
      self.kind   = attributes[:kind]
      self.number = attributes[:number]
    end
  end  
end  