require 'yaml'

require 'akatus/base'
require 'akatus/installments'
require 'akatus/payment_methods'
require 'akatus/transactions'
require 'akatus/product'
require 'akatus/order'
require 'akatus/credit_card'

module Akatus
  autoload :Installments,   'akatus/installments'
  autoload :PaymentMethods, 'akatus/payment_methods'
  autoload :Transactions,   'akatus/transactions'
  autoload :Product,        'akatus/product'
  autoload :Order,          'akatus/order'
end  

if defined?(Rails)
  Akatus.env         = Rails.env
  Akatus.config_file = Rails.root.join("config/akatus.yml")
end
