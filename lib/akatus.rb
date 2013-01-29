require 'akatus/installments'
require 'akatus/payment_methods'
require 'akatus/transactions'

module Akatus
  CONFIG = YAML.load_file(File.join('config', 'akatus.yml'))[Rails.env]
  EMAIL = CONFIG['email']
  API_KEY = CONFIG['api_key']
  AKATUS_URI = "#{CONFIG["uri"]}/api/v1"

  autoload :Installments,     'akatus/installments'
  autoload :PaymentMethods,   'akatus/payment_methods'
  autoload :Transactions,     'akatus/transactions'
end