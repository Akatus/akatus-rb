module Akatus
  class Transactions
    def process(params = {})
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.carrinho {
          xml.recebedor {
            xml.api_key API_KEY
            xml.email EMAIL
          }
          xml.pagador {
            xml.nome params[:buyer][:name]
            xml.email params[:buyer][:email]
          }
          xml.produtos {
            params[:payment][:payment_items].each do |item|
              xml.produto {
                xml.codigo item[:code]
                xml.descricao item[:name]
                xml.quantidade item[:quantity] || 1
                xml.peso item[:weight] || 0.0
                xml.frete item[:freight_amount] || 0.0
                xml.preco item[:price]
              }
            end  
          }
          xml.transacao {
            xml.desconto_total params[:payment][:discount_amount] || 0.0
            xml.peso_total params[:payment][:weight] || 0.0
            xml.frete_total params[:payment][:freight_amount] || 0.0
            xml.moeda 'BRL'
            xml.meio_de_pagamento params[:payment_method]
          }
        }
      end        
    end

    def self.status(akatus_uuid)
      url = "#{AKATUS_URI}/transacao-simplificada/#{akatus_uuid}.json?email=#{EMAIL}&api_key=#{API_KEY}"
      request = HTTPI::Request.new
      request.url = url
      request.open_timeout = 10 # sec
      request.read_timeout = 30 # sec
      @response ||= HTTPI.get request
      #TODO Finish to implement this
    end  
  end
end  