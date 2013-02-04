module Akatus
  class Transactions
    def self.process(order)
      xml = prepare_xml_to_send order
    end

    def self.status(akatus_uuid)
      url = "#{akatus_api_uri}/transacao-simplificada/#{akatus_uuid}.json?email=#{seller_email}&api_key=#{seller_api_key}"
      request = HTTPI::Request.new
      request.url = url
      request.open_timeout = 10 # sec
      request.read_timeout = 30 # sec
      @response ||= HTTPI.get request
      #TODO Finish to implement this
    end

    private

      def self.prepare_xml_to_send(order)
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.carrinho {
            xml.recebedor {
              xml.api_key seller_api_key
              xml.email seller_email
            }
            xml.pagador {
              xml.nome order.buyer_name
              xml.email order.buyer_email
              xml.enderecos {
                xml.endereco {
                  xml.tipo order.address.kind || 'cobranca'
                  xml.logradouro order.address.street
                  xml.numero order.address.number
                  xml.bairro order.address.neigborhood
                  xml.cidade order.address.city
                  xml.estado order.address.state
                  xml.pais order.address.country || 'BRA'
                  xml.cep order.address.postal_code
                }
              }
            }
            xml.produtos {
              order.products.each do |product|
                xml.produto {
                  xml.codigo product.code
                  xml.descricao product.name
                  xml.quantidade product.quantity || 1
                  xml.peso product.weight || 0.0
                  xml.frete product.freight_amount || 0.0
                  xml.preco product.price
                }
              end
            }

            xml.

            xml.transacao {
              xml.desconto_total order.discount_amount || 0.0
              xml.peso_total order.weight || 0.0
              xml.frete_total order.freight_amount || 0.0
              xml.moeda 'BRL'
              xml.meio_de_pagamento map_payment_method(order.payment_method)
              xml.parcelas order.installments
              xml.referencia order.uuid
              if order.credit_card?
                xml.numero order.credit_card.number
                xml.expiracao order.credit_card.expires_at
                xml.codigo_de_seguranca order.credit_card.cvv
                xml.portador {
                  xml.nome order.credit_card.holder_name
                  xml.cpf order.credit_card.holder_cpf
                  xml.telefone order.credit_card.phone
                }
              end  
            }
          }
        end
      end

      def self.map_payment_method(payment_method)
        case payment_method.to_sym
        when :bill
          'boleto'
        when :eft
          'tef'
        when :master
          'cartao_master'
        when :visa
          'cartao_visa'
        when :amex 
          'cartao_amex'
        when :diners     
          'cartao_diners'
        when :elo 
          'cartao_elo' 
        end
      end
  end
end
