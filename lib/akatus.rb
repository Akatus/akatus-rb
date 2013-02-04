require 'yaml'

require 'akatus/base'
require 'akatus/installments'
require 'akatus/payment_methods'
require 'akatus/transactions'
require 'akatus/product'
require 'akatus/order'
require 'akatus/credit_card'
require 'akatus/address'
require 'akatus/phone'

module Akatus
  autoload :Installments,   'akatus/installments'
  autoload :PaymentMethods, 'akatus/payment_methods'
  autoload :Transactions,   'akatus/transactions'
  autoload :Product,        'akatus/product'
  autoload :Order,          'akatus/order'
  autoload :CreditCard,     'akatus/credit_card'
  autoload :Address,        'akatus/address'
  autoload :Phone,          'akatus/phone'
end  

if defined?(Rails)
  Akatus.env         = Rails.env
  Akatus.config_file = Rails.root || Pathname.new('').join("config/akatus.yml")
end
