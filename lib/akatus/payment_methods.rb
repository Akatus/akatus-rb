#encoding: UTF-8

module Akatus
  class PaymentMethods
    def self.available
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.meios_de_pagamento {
          xml.correntista {
            xml.api_key API_KEY
            xml.email EMAIL
          }
        }
      end  
      request = HTTPI::Request.new(AKATUS_URI + '/meios-de-pagamento.xml')
      request.body = builder.to_xml
      request.open_timeout = 10 # sec
      request.read_timeout = 30 # sec

      parsed_response = parse_response(HTTPI.post request)
      splited_payment_methods = split_by_kind(parsed_response)
    end

    private

    def self.split_by_kind(parsed_response)
      splited_payment_methods = {}
      parsed_response.each do |pr|
        if pr['descricao'] == 'Cartão de Crédito' || pr['descricao'] == 'TEF'
          payment_methods = []
          pr['bandeiras']['bandeira'].each do |pm|
            payment_method = {}
            payment_method[:code] = pm['codigo']
            payment_method[:description] = pm['descricao']
            payment_method[:installments] = pm['parcelas'].to_i
            payment_methods << payment_method
          end       
          if pr['descricao'] == 'Cartão de Crédito'
            splited_payment_methods[:credit_card] = payment_methods
          else
            splited_payment_methods[:eft] = payment_methods
          end
        else
          bills = []
          bill = {}
          bill[:code] = pr['codigo']
          bill[:description] = pr['descricao']
          bill[:installments] = pr['parcelas'].to_i
          bills << bill
          splited_payment_methods[:bill] = bills
        end
      end  
      splited_payment_methods
    end

    def self.parse_response(response)
      parsed_response = Hash.from_xml(Nokogiri.XML(response.raw_body).to_s)
      raise StandardError, 'Akatus account not found' if parsed_response['resposta']['status'] == 'erro'
      parsed_response['resposta']['meios_de_pagamento']['meio_de_pagamento']
    end
  end  
end